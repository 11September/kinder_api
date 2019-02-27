<?php

namespace App\Http\Controllers\App;

use App\User;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class ConversationController
{
    public function createOrGetConversation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            if ($request->user_id == $user->id) {
                return response()->json(['message' => 'Користувач не може звернутися до листування з собою!'], 409);
            }

            $conversation = Conversation::where([
                ['user1_id', '=', $user->id],
                ['user2_id', '=', $request->user_id],
            ])->OrWhere([
                ['user2_id', '=', $user->id],
                ['user1_id', '=', $request->user_id],
            ])
                ->with(array
                ('messages' => function ($query) {
                        $query->select('id', 'user_id', 'conversation_id', 'message', 'status');
                    }))
                ->first();

            if (!$conversation) {
                $conversation = new Conversation();
                $conversation->user1_id = $user->id;
                $conversation->user2_id = $request->user_id;

                $conversation->save();
                $conversation->client_id = $user->id;
                $conversation->messages = [];
            } else {
                if ($conversation->messages) {
                    foreach ($conversation->messages as $message) {
                        if ($message->user_id == $user->id) {
                            $message->self = true;
                        } else {
                            $message->self = false;
                        }
                    }

                    $conversation->client_id = $user->id;
                    $conversation->messages = [];
                } else {
                    $conversation->client_id = $user->id;
                    $conversation->messages = [];
                }
            }

            return ['data' => $conversation];

        } catch (\Exception $exception) {
            Log::warning('ConversationController@createOrGetConversation Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
