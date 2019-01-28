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


            //  Push to User

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
                ->whereIn('school_id', $request->school_id)
                ->whereIn('group_id', $request->group_id)
                ->first();

            \OneSignal::sendNotificationToUser($message->message, $user->player_id);
            //  Push to User end


            //           Fetch this conversations
            $messages = Message::select('id', 'message', 'status', 'user_id')
                ->where('conversation_id', $request->conversation_id)
                ->oldest()
                ->get();

            foreach ($messages as $message) {
                if ($message->user_id == $user->id) {
                    $message->self = true;
                } else {
                    $message->self = false;
                }
            }

            foreach ($messages as $message) {
                unset($message->id);
                unset($message->user_id);
            }
            //           Fetch this conversations

            return ['message' => 'Повідомлення збережено!', 'data' => $messages];

        } catch (\Exception $exception) {
            Log::warning('MessagesController@storeMessage Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
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
}
