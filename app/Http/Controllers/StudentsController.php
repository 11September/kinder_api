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
        $users = User::where('type', 'default')->get();

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
        $user->token = Hash::make($request->email);

        User::create($request->all());

        return redirect()->route('admin.posts')->with('message','Новость успешно добавлена!');
    }

}
