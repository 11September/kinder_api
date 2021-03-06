<?php

namespace App\Http\Controllers;

use App\Clas;
use App\Group;
use App\School;
use App\Schedule;
use Illuminate\Http\Request;

class SchedulesController extends Controller
{
    public function adminIndex()
    {
        $schools = School::all();

        if ($schools->first()){
            $groups = Group::where('school_id', $schools->first()->id)->get();
        }else{
            $groups = [];
        }

        return view('admin.schedules', compact('schools', 'groups'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $current_group = Group::where('id', $id)->first();

        $current_school = School::where('id', $current_group->school_id)->first();

        $groups = Group::where('school_id', $current_school->id)->get();

        $schedules = Schedule::where('school_id', $current_school->id)
            ->where('group_id', $current_group->id)
            ->with('lessons')
            ->get();

        return view('admin.schedules.show', compact('list_schools', 'schedules', 'current_school', 'current_group' ,'groups'));
    }

    public function adminGetLessonsAll(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
            'group_id' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)
            ->where('group_id', $request->group_id)
            ->with('lessons')
            ->get();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminGetLessonsByDay(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
            'group_id' => 'required',
            'day' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)
            ->where('group_id', $request->group_id)
            ->where('day', $request->day)->with('lessons')->first();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminSaveLessonsByDay(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'from' => 'required',
            'to' => 'required',

            'school_id' => 'required',
            'group_id' => 'required',
            'day' => 'required',
            'schedule_id' => '',
            'lesson_id' => '',
        ]);

        if ($request->lesson_id) {
            $lesson = Clas::where('id', $request->lesson_id)->first();
            $lesson->name = $request->name;
            $lesson->from = $request->from;
            $lesson->to = $request->to;
            $lesson->save();
        } else {
            if ($request->schedule_id) {
                $schedule = Schedule::where('id', $request->schedule_id)->where('group_id', $request->group_id)->first();

                $lesson = Clas::where('schedule_id', $schedule->id)->first();
                $lesson->name = $request->name;
                $lesson->from = $request->from;
                $lesson->to = $request->to;
                $lesson->save();

            } else {
                $schedule = Schedule::where('school_id', $request->school_id)->where('group_id', $request->group_id)->where('day', $request->day)->first();

                if ($schedule) {
                    $lesson = new Clas();
                    $lesson->schedule_id = $schedule->id;
                    $lesson->name = $request->name;
                    $lesson->from = $request->from;
                    $lesson->to = $request->to;
                    $lesson->save();
                } else {
                    $schedule = new Schedule();
                    $schedule->school_id = $request->school_id;
                    $schedule->group_id = $request->group_id;
                    $schedule->day = $request->day;
                    $schedule->save();

                    $lesson = new Clas();
                    $lesson->schedule_id = $schedule->id;
                    $lesson->name = $request->name;
                    $lesson->from = $request->from;
                    $lesson->to = $request->to;
                    $lesson->save();
                }
            }
        }

        return response()->json(['success' => true, 'id' => $lesson->id]);
    }

    public function adminDeleteLessonsByDay(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $lesson = Clas::where('id', $request->id)->first();
        $schedule_id = $lesson->schedule_id;

        $lesson->delete();

        $classes = Clas::where('schedule_id', $schedule_id)->get();
        if (count($classes) < 1){
            Schedule::where('id', $schedule_id)->delete();
        }

        return response()->json(['success' => true]);
    }
}
