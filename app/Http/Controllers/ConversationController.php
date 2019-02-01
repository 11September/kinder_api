<?php

namespace App\Http\Controllers;

use App\User;
use App\Group;
use App\School;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ConversationController extends Controller
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
            } else {
                foreach ($conversation->messages as $message) {
                    if ($message->user_id == $user->id) {
                        $message->self = true;
                    } else {
                        $message->self = false;
                    }
                }
            }

            return ['data' => $conversation];

        } catch (\Exception $exception) {
            Log::warning('ConversationController@createOrGetConversation Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function admin()
    {
        $schools = School::all();

        if ($schools->first()) {
            $groups = Group::whereHas('schools', function ($query) use ($schools) {
                $query->where('school_id', '=', $schools->first()->id);
            })->get();
        } else {
            $groups = [];
        }


        $user = Auth::user();
        $conversations = Conversation::where([
            ['user1_id', '=', $user->id],
        ])->OrWhere([
            ['user2_id', '=', $user->id],
        ])->with('messages')
            ->with(array
            ('messages' => function ($query) {
                    $query->select('id', 'user_id', 'conversation_id', 'status');
                }))
            ->get();

        $conversations->load('user1', 'user2');

        foreach ($conversations as $conversation) {

            $counter_group = 0;

            foreach ($groups as $group) {
                if ($conversation->user1->group_id == $group->id || $conversation->user2->group_id) {

                    foreach ($conversation->messages as $message) {
                        if ($message->user_id !== $user->id && $message->status == "unread") {
                            $counter_group++;
                        }
                    }

                    $group->counter = $counter_group;
                }
            }
        }

        return view('admin.conversations.index', compact('schools', 'groups'));
    }

    public function adminShowGroupUsers($id)
    {
        $current_user_id = Auth::id();
        $list_schools = School::with('groups')->get();

        $group = Group::where('id', $id)
            ->with(array('students' => function ($query) {
                $query->where('type', '=', 'default');
            }))
            ->first();

        $users = $group->students;

        foreach ($users as $user) {
            $count = 0;

            $conversations = Conversation::where([
                ['user1_id', '=', $user->id],
                ['user2_id', '=', $current_user_id]
            ])->OrWhere([
                ['user1_id', '=', $current_user_id],
                ['user2_id', '=', $user->id]
            ])->with('messages')->get();

            foreach ($conversations as $conversation) {
                foreach ($conversation->messages as $message) {
                    if ($message->user_id != $current_user_id && $message->status == "unread") {
                        $count++;
                    }
                }
            }

            $user->count = $count;
        }

        return view('admin.conversations.adminShowGroupUsers', compact('list_schools', 'group', 'users'));
    }

    public function checkConversation($id)
    {
        $conversation = Conversation::where([
            ['user1_id', '=', Auth::id()],
            ['user2_id', '=', $id],
        ])->OrWhere([
            ['user2_id', '=', Auth::id()],
            ['user1_id', '=', $id],
        ])->with('messages')->first();

        if (!$conversation) {
            $conversation = new Conversation();
            $conversation->user1_id = Auth::id();
            $conversation->user2_id = $id;

            $conversation->save();
        }

        return redirect()->route('admin.conversation.user', $conversation->id);
    }

    public function groupUsers($id)
    {
        $list_schools = School::with('groups')->get();

        $group = Group::where('id', $id)->with('students', 'moderator')->first();

        $users = $group->students;

        return view('admin.messages.show', compact('list_schools', 'group', 'users'));
    }

    public function user($id)
    {
        $conversation = Conversation::where('id', $id)->with('messages', 'user2')->first();

        $user = User::where('id', $conversation->user2_id)->first();

        if ($user->group_id) {
            $users = User::where('group_id', $user->group_id)->where('type', 'default')->with('messages')->get();
        } else {
            $user = User::where('id', $conversation->user1_id)->first();
            $users = User::where('group_id', $user->group_id)->where('type', 'default')->with('messages')->get();
        }

        $list_schools = School::with('groups')->get();

        $groups = Group::whereHas('schools', function ($query) use ($list_schools) {
            $query->where('school_id', '=', $list_schools->first()->id);
        })->get();

        return view('admin.conversations.chatUser', compact('list_schools', 'groups', 'users', 'conversation'));
    }
}
