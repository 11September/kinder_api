<?php

namespace App\Http\Controllers;

use App\Clas;
use App\School;
use App\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class SchedulesController extends Controller
{
    public function index($school_id)
    {
        if (!$school_id || empty($school_id) || !is_numeric($school_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $schedule = Schedule::where('school_id', $school_id)
                ->with(array('lessons' => function ($query) {
                    $query->select('id', 'name', 'from', 'to', 'schedule_id');
                }))
                ->get();

            if (!$schedule || count($schedule) < 1) {
                return response()->json(['message' => 'Розклад не знайдено!'], 404);
            }

            return ['data' => $schedule];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function adminIndex()
    {
        $list_schools = School::all();

        $schedules = Schedule::with('lessons')->with('school')->get()->groupBy('school_id');

        return view('admin.schedules', compact('list_schools', 'schedules'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $schedules = Schedule::where('school_id', $id)->with('lessons')->get();

        $current_school = School::where('id', $id)->first();

        return view('admin.schedules.show', compact('list_schools', 'schedules', 'current_school'));
    }

    public function adminGetLessonsByDay(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
            'day' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)->where('day', $request->day)->with('lessons')->first();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminGetLessonsAll(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
        ]);

        $schedules = Schedule::where('school_id', $request->school_id)->with('lessons')->get();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminDeleteLessonsByDay(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $lesson = Clas::where('id', $request->id)->first();
        $lesson->delete();

        return response()->json(['success' => true]);
    }

    public function adminSaveLessonsByDay(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'from' => 'required',
            'to' => 'required',

            'school_id' => 'required',
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
                $schedule = Schedule::where('id', $request->schedule_id)->first();

                $lesson = Clas::where('schedule_id', $schedule->id)->first();
                $lesson->name = $request->name;
                $lesson->from = $request->from;
                $lesson->to = $request->to;
                $lesson->save();

            } else {
                $schedule = Schedule::where('school_id', $request->school_id)->where('day', $request->day)->first();

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
}
