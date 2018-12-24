<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function admin()
    {
        return view('admin.admin');
    }

    public function admins()
    {
        $users = User::select('id', 'name', 'email', 'type')->get();

        return view('admin.admins', compact('users'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'type' => 'required',
        ]);

        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $request->type;
        $user->token = str_random(6);
        $user->password = Hash::make(str_random(6));

        $user->save();

        return view('admin.admins');
    }

    public function delete(User $user)
    {
        $user->delete();

        return redirect()->back();
    }

    public function users()
    {
        return view('admin.users');
    }

    public function kindergartens()
    {
        return view('admin.kindergartens');
    }
}
