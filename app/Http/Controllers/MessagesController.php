<?php

namespace App\Http\Controllers;

use App\User;
use App\Group;
use App\School;
use App\Message;
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
}
