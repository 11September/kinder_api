<?php

namespace App\Http\Controllers;

use App\User;
use App\Group;
use App\School;
use App\Student;
use App\Mail\LoginMail;
use App\Mail\DeleteProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\StoreStudent;
use App\Http\Requests\UpdateStudent;
use Illuminate\Support\Facades\Hash;

class StudentsController extends Controller
{
    public function index(Request $request)
    {
        try {
            $students = Student::select('id', 'FIO', 'birthday', 'user_id')
                ->with(array('users' => function ($query) {
                    $query->select('id', 'name', 'email');
                }))
                ->published()
                ->filter($request->all())
                ->get();

            return ['data' => $students];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function adminIndex()
    {
        $users = User::where('type', 'default')
            ->with(array('school' => function ($query) {
                $query->select('id', 'name');
            }))
            ->with(array('group' => function ($query) {
                $query->select('id', 'name');
            }))
            ->latest()
            ->get();

        return view('admin.users', compact('users'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        $groups = Group::whereHas('schools', function ($query) use ($schools) {
            $query->where('school_id', '=', $schools->first()->id);
        })->get();

//        $groups = Group::where('school_id', $schools->first()->id)->get();

        return view('admin.users.create', compact('schools', 'groups'));
    }

    public function adminStore(StoreStudent $request)
    {
        $password = $request->password;

        $user = new User();
        $user->name = $request->name;
        $user->birthday = $request->birthday;
        $user->parent_name = $request->parent_name;
        $user->parent_phone = $request->parent_phone;
        $user->parents = $request->parents;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->school_id = $request->school_id;
        $user->group_id = $request->group_id;
        $user->status = $request->status;

        $user->password = Hash::make($request->password);
        $user->token = Hash::make($request->email);

        $user->save();

        \Mail::to($request->email)->send(new LoginMail($user, $password));

        return redirect()->route('admin.users')->with('message', 'Користувач успішно доданий! Перевiрте пошту!');
    }

    public function adminEdit($id)
    {
        $user = User::where('id', $id)->with('group')->first();

        $schools = School::all();

        return view('admin.users.edit', compact('user', 'groups', 'schools'));
    }

    public function adminUpdate(UpdateStudent $request, $id)
    {
        $user = User::where('id', $id)->first();

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
        $user->parent_name = $request->parent_name;
        $user->parent_phone = $request->parent_phone;
        $user->parents = $request->parents;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->school_id = $request->school_id;
        $user->group_id = $request->group_id;
        $user->status = $request->status;

        $user->save();

        return redirect()->route('admin.users')->with('message', 'Користувач успішно оновлений!');
    }

    public function adminDelete($id)
    {
        $user = User::find($id);
        $mailTo = $user->email;

        if ($user->avatar && !empty($user->avatar)){
            $image = public_path() . $user->avatar;
            if(file_exists($image)) {
                unlink($image);
            }
        }

        $user->delete();

        \Mail::to($mailTo)->send(new DeleteProfile($user));

        return redirect()->route('admin.users')->with('message', 'Користувач успішно видалений!');
    }

}
