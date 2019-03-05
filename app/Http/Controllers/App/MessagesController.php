<?php

namespace App\Http\Controllers\App;

use LRedis;
use App\User;
use OneSignal;
use App\Message;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Validator;

class MessagesController
{
    public function storeMessage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'conversation_id' => 'required|exists:conversations,id',
            'message' => 'required|string|max:300',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();
            $sender = $user;

            $conversation = Conversation::where('id', $request->conversation_id)->first();

            $message = new Message();
            $message->conversation_id = $request->conversation_id;
            $message->message = $request->message;
            $message->user_id = $user->id;
            $message->save();

            $receiver_id = ($conversation->user1_id == $user->id) ? $conversation->user2_id : $conversation->user1_id;

            $receiver = User::select('id', 'player_id', 'name', 'parent_name', 'push_chat')
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


            if ($receiver && isset($receiver->player_id) && !empty($receiver->player_id) && $receiver->push_chat == "true") {
                $this->sendToOneSignal($sender, $receiver, $request->message);
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
