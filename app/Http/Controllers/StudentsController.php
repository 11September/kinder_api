<?php

namespace App\Http\Controllers;

use App\School;
use App\Student;
use App\User;
use Illuminate\Http\Request;
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
        $users = User::where('type', 'admin')->get();

        return view('admin.users', compact('users'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        return view('admin.users.create',compact('schools'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'body' => 'required',
            'until' => 'required',
            'school_id' => 'required',
            'preview' => 'required',
            'image' => 'required',
        ]);

        $user = new User();
        $user->title = $request->title;
        $user->body = $request->body;
        $user->until = $request->until;
        $user->school_id = $request->school_id;

        $user->save();

        return redirect()->route('admin.posts')->with('message','Новость успешно добавлена!');
    }

}
