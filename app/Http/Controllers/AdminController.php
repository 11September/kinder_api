<?php

namespace App\Http\Controllers;

use App\Post;
use App\User;
use App\Group;
use App\School;
use App\Message;
use Illuminate\Http\Request;
use App\Mail\LoginMailModerator;
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
        $users = User::where('type', 'default')->active()->count();
        $admins = User::where('type', '!=' ,'default')->count();
        $news = Post::count();
        $messages = Message::count();

        return view('admin.panel', compact('schools', 'groups', 'users', 'admins', 'news', 'messages'));
    }

    public function admins()
    {
        $users = User::select('id', 'name', 'email', 'type', 'status')->where('type', '!=', 'default')->get();

        return view('admin.admins', compact('users'));
    }

    public function store(StoreAdmin $request)
    {
        $password = $request->password;

        $user = new User();
        $user->name = $request->name;
        $user->birthday = $request->birthday;
        $user->email = $request->email;
        $user->type = $request->type;
        $user->school_id = null;
        $user->group_id = null;
        $user->token = Hash::make($request->email);
        $user->password = Hash::make($request->password);
        $user->status = "active";

        $user->save();

        \Mail::to($request->email)->send(new LoginMailModerator($user, $password));

        return redirect()->route('admins')->with('message','Користувач успішно створений!');
    }

    public function adminEdit(Request $request, $id)
    {
        $user = User::select('id', 'name', 'email', 'type', 'birthday')->where('id', $id)->first();

        $users = User::select('id', 'name', 'email', 'type', 'status')->where('type', '!=', 'default')->get();

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
        $user->birthday = $request->birthday;
        $user->email = $request->email;
        $user->type = $request->type;

        $user->save();

        return redirect()->route('admins.edit', $user->id)->with('message','Користувач успішно змінений!');
    }

    public function adminDelete($id)
    {
        $user = User::find($id);

        if ($user->group_id){
            $group = Group::where('id', $user->group_id)->first();
            return redirect()->back()->with('message','Неможливо видалити користувача, так як він модератор групи - '  . $group->name . '! Відв\'яжіть користувача від групи!');
        }

        $group = Group::where('user_id', $user->id)->first();
        if ($group){
            return redirect()->back()->with('message','Неможливо видалити користувача, так як він адмiнiстратор групи - '  . $group->name . '! Відв\'яжіть користувача від групи!');
        }

        if ($user->avatar && !empty($user->avatar)) {
            $image = storage_path('app/public') . $user->avatar;
            if (file_exists($image)) {
                unlink($image);
            }
        }

        $user->delete();

        return redirect()->route('admins', $user->id)->with('message','Користувач успішно видалений!');
    }
}
