<?php

namespace App\Http\Controllers;

use App\Post;
use App\User;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StoreAdmin;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function admin()
    {
        $schools = School::count();
        $groups = Group::count();
        $users = User::where('type', 'default')->count();
        $news = Post::count();

        return view('admin.panel', compact('schools', 'groups', 'users', 'news'));
    }

    public function admins()
    {
        $users = User::select('id', 'name', 'email', 'type')->where('type', '!=', 'default')->get();

        return view('admin.admins', compact('users'));
    }

    public function store(StoreAdmin $request)
    {
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $request->type;
        $user->token = str_random(6);
        $user->password = Hash::make($request->password);

        $user->save();

        return view('admin.admins');
    }

    public function adminEdit(Request $request, $id)
    {
        $user = User::select('id', 'name', 'type')->where('id', $id)->first();

        $users = User::select('id', 'name', 'email', 'type')->where('type', '!=', 'default')->get();

        return view('admin.admins.edit', compact('user', 'users'));
    }

    public function adminUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'type' => 'required',
        ]);

        $user = User::select('id', 'name', 'type')->where('id', $id)->first();
        $user->name = $request->name;
        $user->type = $request->type;
        $user->save();

        return redirect()->route('admin.admins')->with('message','Користувач успішно змінений!');
    }

    public function delete(User $user)
    {
        $user->delete();

        return redirect()->back();
    }

    public function kindergartens()
    {
        return view('admin.kindergartens');
    }
}
