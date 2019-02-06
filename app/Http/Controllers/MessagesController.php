<?php

namespace App\Http\Controllers;

use LRedis;
use App\User;
use OneSignal;
use App\Group;
use App\School;
use App\Message;
use App\Conversation;
use App\Events\NewMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;
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
            $conversation = Conversation::where('id', $request->conversation_id)->first();

            $message = new Message();
            $message->conversation_id = $request->conversation_id;
            $message->message = $request->message;
            $message->user_id = $user->id;
            $message->save();

            $receiver_id = ($conversation->user1_id == $user->id) ? $conversation->user2_id : $conversation->user1_id;

            $user = User::select('id', 'player_id')
                ->where('id', $receiver_id)
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->first();


            $data = [
                'conversation_id' => $request->conversation_id,
                'message' => $request->message,
                'client_id' => $receiver_id
            ];
            $redis = Redis::connection();
            $redis->publish('message', json_encode($data));

            if ($user && isset($user->player_id) && !empty($user->player_id)) {
                $this->sendToOneSignal($user, $request->message);
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

            $receiver_id = ($conversation->user1_id == $user->id) ? $conversation->user2_id : $conversation->user1_id;

            $messages = Message::where('conversation_id', $conversation->id)
                ->where('user_id', $receiver_id)
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

        $conversation = Conversation::findOrFail($request->conversation_id);
        if ($conversation->user1_id == Auth::user()->id || $conversation->user2_id == Auth::user()->id) {
            $message = new Message();
            $message->conversation_id = $request->conversation_id;
            $message->message = $request->message;
            $message->user_id = Auth::id();
            $message->save();

            $receiver_id = ($conversation->user1_id == Auth::user()->id) ? $conversation->user2_id : $conversation->user1_id;
            $user = User::select('id', 'player_id')
                ->where('id', $receiver_id)
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->first();

            if ($user && isset($user->player_id) && !empty($user->player_id)) {
                $this->sendToOneSignal($user, $request->message);
            }

//            event(new NewMessage($request->conversation_id, $request->message, $receiver_id));

            $data = [
                'conversation_id' => $request->conversation_id,
                'message' => $request->message,
                'client_id' => $receiver_id
            ];
            $redis = Redis::connection();
            $redis->publish('message', json_encode($data));

            return response()->json(true);
        }

        return response()->json("permission error");
    }


//    public function store(Request $request)
//    {
//        $conversation = Conversation::findOrFail($request->conversation_id);
//        if ($conversation->user1_id == Auth::user()->id || $conversation->user2_id == Auth::user()->id) {
//            $message = new Message;
//            $message->conversation_id = $request->conversation_id;
//            $message->user_id = Auth::user()->id;
//            $message->message = $request->message;
//            $message->status = "unread";
//            $message->save();
//
//            $receiver_id = ($conversation->user1_id == Auth::user()->id) ? $conversation->user2_id : $conversation->user1_id;
//
////            event(new NewMessage($request->conversation_id, $request->message, $receiver_id));
//
//            $data = [
//                'conversation_id' => $request->conversation_id,
//                'message' => $request->message,
//                'client_id' => $receiver_id
//            ];
//            $redis = Redis::connection();
//            $redis->publish('message', json_encode($data));
//
//            return response()->json(true);
//        }
//        return response()->json("permission error");
//    }
//
//    public function setReadMessages($user_id)
//    {
//        if (!$user_id || empty($user_id) || !is_numeric($user_id)) {
//            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
//        }
//
//        $messages = Message::where('user_id', $user_id)->get();
//
//        foreach ($messages as $message) {
//            $message->status = 'read';
//            $message->save();
//        }
//
//        return response()->json(['success' => true]);
//    }

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

    public function sendToOneSignal($user, $message)
    {
//        dd("in signal method", $user);

        $player_ids = array();
        $player_ids[0] = $user->player_id;
        $params = [];
        $params['headings'] = [
            "en" => (isset($user->parent_name)) ? $user->parent_name : $user->name
        ];
        $params['contents'] = [
            "en" => $message
        ];
        $params['include_player_ids'] = $player_ids;

        \OneSignal::sendNotificationCustom($params);
    }
}
