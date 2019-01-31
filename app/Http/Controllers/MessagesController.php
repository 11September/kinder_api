<?php

namespace App\Http\Controllers;

use App\User;
use OneSignal;
use App\Group;
use App\School;
use App\Message;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class MessagesController extends Controller
{
    public function storeMessage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'conversation_id' => 'required|exists:conversations,id',
            'message' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            $message = new Message();
            $message->conversation_id = $request->conversation_id;
            $message->message = $request->message;
            $message->user_id = $user->id;
            $message->save();

            $conversation = Conversation::where('id', $request->conversation_id)->first();

            $need_user_id = null;
            if ($conversation->user1_id == $user->id) {
                $need_user_id = $conversation->user2_id;
            }
            if ($conversation->user2_id == $user->id) {
                $need_user_id = $conversation->user1_id;
            }

            $user = User::select('id', 'player_id')
                ->where('id', $need_user_id)
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->first();

            if (isset($user->player_id) && !empty($user->player_id)) {
                \OneSignal::sendNotificationToUser($message->message, $user->player_id);
            }

            return ['message' => 'Повідомлення збережено!'];

        } catch (\Exception $exception) {
            Log::warning('MessagesController@storeMessage Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function unreadMessagesCounter(Request $request)
    {
        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            $conversations = Conversation::where([
                ['user1_id', '=', $user->id],
            ])->OrWhere([
                ['user2_id', '=', $user->id],
            ])
                ->with(array
                ('messages' => function ($query) {
                        $query->select('id', 'user_id', 'conversation_id', 'status');
                    }))
                ->get();

            $counter = 0;
            foreach ($conversations as $conversation) {
                foreach ($conversation->messages as $message) {
                    if ($message->user_id != $user->id && $message->status == "unread") {
                        $counter++;
                    }
                }
            }

            return ['count' => $counter];

        } catch (\Exception $exception) {
            Log::warning('ConversationController@createOrGetConversation Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function messagesMarkRead(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'conversation_id' => 'required|exists:conversations,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();
            $conversation = Conversation::where('id', $request->conversation_id)->first();

            $need_user_id = null;
            if ($conversation->user1_id == $user->id) {
                $need_user_id = $conversation->user2_id;
            }
            if ($conversation->user2_id == $user->id) {
                $need_user_id = $conversation->user1_id;
            }

            $messages = Message::where('conversation_id', $conversation->id)
                ->where('user_id', $need_user_id)
                ->where('status', 'unread')
                ->get();

            if (!$messages || count($messages) < 1) {
                return response()->json(['message' => 'Повідомлень не знайдено!'], 404);
            }

            foreach ($messages as $message) {
                $message->status = 'read';
                $message->save();
            }

            return ['message' => 'Повідомлення помічені як прочитані!'];

        } catch (\Exception $exception) {
            Log::warning('MessagesController@messagesMarkRead Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function adminIndex()
    {
        $schools = School::all();

        $groups = Group::whereHas('schools', function ($query) use ($schools) {
            $query->where('school_id', '=', $schools->first()->id);
        })->get();

        return view('admin.messages', compact('schools', 'groups'));
    }

    public function adminShow($id)
    {
        $list_schools = School::with('groups')->get();

        $group = Group::where('id', $id)->with('students', 'moderator')->first();

        $users = $group->students;

        return view('admin.messages.show', compact('list_schools', 'group', 'users'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'conversation_id' => 'required|exists:conversations,id',
            'message' => 'required|string',
        ]);

        $message = new Message();
        $message->conversation_id = $request->conversation_id;
        $message->message = $request->message;
        $message->user_id = Auth::id();
        $message->save();


        $user = Auth::user();
        $conversation = Conversation::where('id', $request->conversation_id)->first();

        $need_user_id = null;
        if ($conversation->user1_id == $user->id) {
            $need_user_id = $conversation->user2_id;
        }
        if ($conversation->user2_id == $user->id) {
            $need_user_id = $conversation->user1_id;
        }

        $user = User::select('id', 'player_id')
            ->where('id', $need_user_id)
            ->where('player_id', '!=', null)
            ->where('push', 'enabled')
            ->active()
            ->first();

        if (isset($user->player_id) && !empty($user->player_id)) {
            \OneSignal::sendNotificationToUser($message->message, $user->player_id);
        }

        return redirect()->route('admin.conversation.user', $request->conversation_id);
    }

    public function setReadMessages($user_id)
    {
        if (!$user_id || empty($user_id) || !is_numeric($user_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        $messages = Message::where('user_id', $user_id)->get();

        foreach ($messages as $message) {
            $message->status = 'read';
            $message->save();
        }

        return response()->json(['success' => true]);
    }

    public function fetchMessages(Request $request)
    {
        $request->validate([
            'message_id' => 'required',
            'conversation_id' => 'required|exists:conversations,id',
            'user_id' => 'required',
        ]);

        $messages = Message::where('conversation_id', $request->conversation_id)
            ->where('user_id', $request->user_id)
            ->where('id', '>', $request->message_id)
            ->get();

        return response()->json(['success' => true, 'data' => $messages]);
    }

    public function AdminMessagesCounter(Request $request)
    {
        try {
            $user = Auth::user();

            $conversations = Conversation::where([
                ['user1_id', '=', $user->id],
            ])->OrWhere([
                ['user2_id', '=', $user->id],
            ])
                ->with(array
                ('messages' => function ($query) {
                        $query->select('id', 'user_id', 'conversation_id', 'status');
                    }))
                ->get();

            $counter = 0;
            foreach ($conversations as $conversation) {
                foreach ($conversation->messages as $message) {
                    if ($message->user_id != $user->id && $message->status == "unread") {
                        $counter++;
                    }
                }
            }

            return ['success' => true, 'count' => $counter];

        } catch (\Exception $exception) {
            Log::warning('MessagesController@messagesMarkRead Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['success' => false, 'message' => 'Упс! Щось пішло не так!'], 500);
        }

    }
}
