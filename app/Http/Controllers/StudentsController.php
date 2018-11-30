<?php

namespace App\Http\Controllers;

use App\Student;
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
}
