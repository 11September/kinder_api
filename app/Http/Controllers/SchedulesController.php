<?php

namespace App\Http\Controllers;

use App\Clas;
use App\School;
use App\Schedule;
use Illuminate\Http\Request;

class SchedulesController extends Controller
{
    public function adminIndex()
    {
        $list_schools = School::all();

        return view('admin.schedules',compact('list_schools'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $schedules = Schedule::where('school_id', $id)->with('lessons')->get();

        $current_school = School::where('id', $id)->first();

        return view('admin.schedules.show',compact('list_schools', 'schedules', 'current_school'));
    }

    public function adminGetLessonsByDay(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
            'day' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)->where('day', $request->day)->with('lessons')->first();

        return response()->json(['data'=> $schedules, 'success'=>true]);
    }

    public function adminGetLessonsAll(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)->with('lessons')->get();

        return response()->json(['data'=> $schedules, 'success'=>true]);
    }

    public function adminDeleteLessonsByDay(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $lesson = Clas::where('id', $request->id)->first();
        $lesson->delete();

        return response()->json(['success'=>true]);
    }
}
