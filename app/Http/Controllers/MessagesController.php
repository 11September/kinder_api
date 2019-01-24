<?php

namespace App\Http\Controllers;

use App\Group;
use App\Message;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessagesController extends Controller
{
    public function __construct()
    {
        return $this->middleware('auth');
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
            'conversation_id' => 'required',
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
