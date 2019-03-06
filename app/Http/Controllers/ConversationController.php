<?php

namespace App\Http\Controllers;

use LRedis;
use App\User;
use App\Group;
use App\School;
use App\Conversation;
use Illuminate\Support\Facades\Auth;

class ConversationController extends Controller
{
    public function admin()
    {
        $schools = School::all();

        if ($schools->first()){
            $groups = Group::where('school_id', $schools->first()->id)->get();
        }else{
            $groups = [];
        }

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

        $conversations->load('user1', 'user2');

        $counter_group = 0;
        foreach ($conversations as $conversation) {
            foreach ($groups as $group) {
                if ($conversation->user1->group_id == $group->id || $conversation->user2->group_id == $group->id) {
                    foreach ($conversation->messages as $message) {
                        if ($message->user_id !== $user->id && $message->status == "unread") {
                            $counter_group++;
                        }
                    }
                }
                $group->counter = $counter_group;
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
                $query->select('id', 'name', 'parent_name', 'parent_phone', 'group_id', 'type');
                $query->orderByRaw("FIELD(type , 'moderator', 'default') ASC");
                $query->where('id', '!=', Auth::user()->id);
            }))
            ->with(array('admin' => function ($query) {
                $query->select('id', 'name', 'parent_name', 'parent_phone', 'group_id', 'type');
                $query->where('id', '!=', Auth::user()->id);
            }))
            ->first();

        $users = $group->students;

        if ($group->admin && $group->admin->id == Auth::id()) {
            $users->prepend($group->admin);
        }

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
        if (Auth::id() == $id) {
            return redirect()->back()->with('error', 'Користувач не може звернутися до листування з собою!');
        }

        $recipient = User::where('id', $id)->first();
        $recipient->load('group');

        if ($recipient->group->user_id == Auth::id()){
            return redirect()->back()->with('error', 'Користувач не може звернутися до листування з групою до якої не належить!');
        }

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

        return redirect()->route('chat.user', $conversation->id);
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
        $conversation = Conversation::where('id', $id)->with('messages', 'user1', 'user2')->first();

        if (Auth::user()->group_id) {
            $group = Group::where('id', Auth::user()->group_id)
                ->with(array('admin' => function ($query) {
                    $query->select('id', 'name', 'parent_name', 'parent_phone', 'group_id', 'type');
                    $query->where('id', '!=', Auth::user()->id);
                    $query->orderByRaw("FIELD(type , 'moderator', 'default') ASC");
                }))
                ->first();

            $users = User::where('group_id', Auth::user()->group_id)->where('id', '!=', Auth::user()->id)->with('messages')->get();

            if ($group->admin) {
                $users->prepend($group->admin);
            }
        } else {
            $receiver_id = ($conversation->user1_id == Auth::id()) ? $conversation->user2_id : $conversation->user1_id;

            $user_for_group = User::where('id', $receiver_id)->first();

            $group = Group::where('id', $user_for_group->group_id)
                ->with(array('admin' => function ($query) {
                    $query->select('id', 'name', 'parent_name', 'parent_phone', 'group_id', 'type');
                    $query->where('id', '!=', Auth::user()->id);
                    $query->orderByRaw("FIELD(type , 'moderator', 'default') ASC");
                }))
                ->first();

            $users = User::where('group_id', $group->id)->where('id', '!=', Auth::user()->id)->orderByRaw("FIELD(type , 'moderator', 'default') ASC")->with('messages')->get();

            if (isset($group->admin)) {
                $users->prepend($group->admin);
            }
        }

        $list_schools = School::with('groups')->get();

        if ($list_schools->first()){
            $groups = Group::where('school_id', $list_schools->first()->id)->get();
        }else{
            $groups = [];
        }

        return view('admin.conversations.chatUser', compact('list_schools', 'groups', 'users', 'conversation'));
    }
}
