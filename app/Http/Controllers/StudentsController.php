<?php

namespace App\Http\Controllers;

use App\Group;
use App\School;
use App\Student;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class StudentsController extends Controller
{
    public function index(Request $request)
    {
        try {
            $students = Student::select('id', 'FIO', 'birthday', 'user_id')
                ->with(array('users'=>function($query){
                    $query->select('id','name', 'email');
                }))
                ->published()
                ->filter($request->all())
                ->get();

            return ['data' => $students];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function adminIndex()
    {
        $users = User::where('type', 'default')
            ->with(array('school'=>function($query){
                $query->select('id','name');
            }))
            ->with(array('group'=>function($query){
                $query->select('id','name');
            }))
            ->get();

        return view('admin.users', compact('users'));
    }

    public function adminCreate()
    {
        $groups = Group::all();

        $schools = School::all();

        return view('admin.users.create',compact('schools', 'groups'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'birthday' => 'required',
            'parent_name' => 'required',
            'parent_phone' => 'required',
            'parents' => 'required',
            'email' => 'required',
            'address' => 'required',
            'password' => 'required|string|min:6|max:255|confirmed',
            'school_id' => 'required',
            'group_id' => 'required',
            'status' => 'required',
        ]);

        $user = new User();
        $user->name = $request->name;
        $user->birthday = $request->birthday;
        $user->parent_name = $request->parent_name;
        $user->parents = $request->parents;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->address = $request->address;
        $user->school_id = $request->school_id;
        $user->group_id = $request->group_id;
        $user->status = $request->status;

        $user->password = Hash::make($request->password);
        $user->token = Hash::make($request->email);

        $user->save();

        return redirect()->route('admin.users')->with('message','Пользователь успешно добавлен!');
    }

    public function adminEdit($id)
    {
        $user = User::where('id', $id)->first();

        $groups = Group::all();

        $schools = School::all();

        return view('admin.users.edit',compact('user','groups', 'schools'));
    }

    public function adminUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'birthday' => 'required',
            'parent_name' => 'required',
            'parent_phone' => 'required',
            'parents' => 'required',
            'email' => 'required',
            'address' => 'required',
            'school_id' => 'required',
            'group_id' => 'required',
            'status' => 'required',
        ]);

        $user = User::where('id', $id)->first();

        if ($request->password && !empty($request->password) && ($request->password == $request->password_confirmation)){
            $user->password = Hash::make($request->password);
        }

        if ($request->password && $request->password_confirmation && ($request->password !== $request->password_confirmation) && (iconv_strlen($request->password < 7)) && (iconv_strlen($request->password_confirmation < 7))){
            return redirect()->back()->with('message','Пароли не совпадают или не соответствуют формату!');
        }

        if($request->password && $request->password_confirmation &&  $request->password !== $request->password_confirmation){
            return redirect()->back()->with('message','Пароли не совпадают или не соответствуют формату!');
        }

        $user->name = $request->name;
        $user->birthday = $request->birthday;
        $user->parent_name = $request->parent_name;
        $user->parents = $request->parents;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->address = $request->address;
        $user->school_id = $request->school_id;
        $user->group_id = $request->group_id;
        $user->status = $request->status;

        $user->save();

        return redirect()->route('admin.users')->with('message','Пользователь успешно обновлён!');
    }

    public function adminDelete($id)
    {
        $user = User::find($id);

        $user->delete();

        return redirect()->route('admin.users')->with('message','Пользователь успешно удалён!');
    }

}
