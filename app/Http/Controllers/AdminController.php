<?php

namespace App\Http\Controllers;

use App\Post;
use App\User;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StoreAdmin;
use App\Http\Requests\UpdateAdmin;
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
        $admins = User::where('type', '!=' ,'default')->count();

        $news = Post::count();

        return view('admin.panel', compact('schools', 'groups', 'users', 'admins', 'news'));
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
        $user->token = Hash::make($request->email);
        $user->password = Hash::make($request->password);

        $user->save();

        return redirect()->route('admin.admins')->with('message','Користувач успішно змінений!');
    }

    public function adminEdit(Request $request, $id)
    {
        $user = User::select('id', 'name', 'email', 'type')->where('id', $id)->first();

        $users = User::select('id', 'name', 'email', 'type')->where('type', '!=', 'default')->get();

        return view('admin.admins.edit', compact('user', 'users'));
    }

    public function adminUpdate(UpdateAdmin $request, User $user)
    {
        if ($request->password && !empty($request->password) && ($request->password == $request->password_confirmation)) {
            $user->password = Hash::make($request->password);
        }

        if ($request->password && $request->password_confirmation && ($request->password !== $request->password_confirmation) && (iconv_strlen($request->password < 7)) && (iconv_strlen($request->password_confirmation < 7))) {
            return redirect()->back()->with('message', 'Паролі не збігаються або не відповідають формату!');
        }

        if ($request->password && $request->password_confirmation && $request->password !== $request->password_confirmation) {
            return redirect()->back()->with('message', 'Паролі не збігаються або не відповідають формату!');
        }

        $user->name = $request->name;
        $user->email = $request->email;
        $user->type = $request->type;

        $user->save();

        return redirect()->route('admin.admins.edit', $user->id)->with('message','Користувач успішно змінений!');
    }

    public function adminDelete($id)
    {
        $user = User::find($id);
        $user->delete();

        return redirect()->route('admin.admins', $user->id)->with('message','Користувач успішно видалений!');
    }

    public function kindergartens()
    {
        return view('admin.kindergartens');
    }
}
