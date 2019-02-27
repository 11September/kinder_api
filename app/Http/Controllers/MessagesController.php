<?php

namespace App\Http\Controllers;

use LRedis;
use App\User;
use OneSignal;
use App\Message;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;

class MessagesController extends Controller
{
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
            $reciver = User::select('id', 'player_id', 'name', 'parent_name', 'push_chat')
                ->where('id', $receiver_id)
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->first();

            if ($reciver && isset($reciver->player_id) && !empty($reciver->player_id) && $reciver->push_chat == "true") {
                $this->sendToOneSignal(Auth::user(), $reciver, $request->message);
            }

            $data = [
                'conversation_id' => $request->conversation_id,
                'message' => $request->message,
                'client_id' => $receiver_id
            ];
            $redis = Redis::connection();
            $redis->publish('message', json_encode($data));

            return response()->json(['success' => true]);
        }

        return response()->json("permission error");
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

    public function sendToOneSignal($sender, $reciver, $message)
    {
        $player_ids = array();
        $player_ids[0] = $reciver->player_id;
        $params = [];
        $params['headings'] = [
            "en" => ($sender->parent_name && isset($sender->parent_name) && !empty($sender->parent_name)) ? $sender->parent_name : $sender->name
        ];
        $params['contents'] = [
            "en" => $message
        ];
        $params['include_player_ids'] = $player_ids;
        $params['data'] = ["user_id" => $sender->id, "user_name" => $sender->name, "type" => "chat"];

        \OneSignal::sendNotificationCustom($params);
    }
}
