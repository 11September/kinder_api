<?php

namespace App\Http\Controllers;

use App\Conversation;
use App\Group;
use App\School;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ConversationController extends Controller
{
    public function admin()
    {
        $schools = School::all();

        $groups = Group::whereHas('schools', function ($query) use ($schools) {
            $query->where('school_id', '=', $schools->first()->id);
        })->get();

        return view('admin.conversations.index', compact('schools', 'groups'));
    }

    public function adminShowGroupUsers($id)
    {
        $list_schools = School::with('groups')->get();

        $group = Group::where('id', $id)
            ->with(array('students'=>function($query){
                        $query->where('type', '=', 'default');
                    }))
            ->first();

        $users = $group->students;

        $users->load('messages');

//        dd($users);

        return view('admin.conversations.adminShowGroupUsers', compact('list_schools', 'group', 'users'));
    }

    public function checkConversation($id)
    {
        $conversation = Conversation::where('user1_id', Auth::id())->where('user2_id', $id)->with('messages')->first();

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
        $users = User::where('group_id', $user->group_id)->where('type', 'default')->with('messages')->get();

        $list_schools = School::with('groups')->get();

        $groups = Group::whereHas('schools', function ($query) use ($list_schools) {
            $query->where('school_id', '=', $list_schools->first()->id);
        })->get();

        return view('admin.conversations.chatUser', compact('list_schools', 'groups', 'users', 'conversation'));
    }
}
