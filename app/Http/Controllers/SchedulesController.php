<?php

namespace App\Http\Controllers;

use App\User;
use App\Clas;
use App\Group;
use App\School;
use App\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class SchedulesController extends Controller
{
    public function index(Request $request)
    {
        try {
            return response()->json(['message' => 'Розклад не знайдено!'], 404);


            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            $schedule = Schedule::where('school_id', $user->school_id)
                ->where('group_id', $user->group_id)
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
        $schools = School::all();

        $groups = Group::whereHas('schools', function ($query) use ($schools) {
            $query->where('school_id', '=', $schools->first()->id);
        })->get();

        return view('admin.schedules', compact('schools', 'groups'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $current_group = Group::where('id', $id)->first();

        $current_school = School::whereHas('groups', function ($query) use ($current_group) {
            $query->where('group_id', '=', $current_group->id);
        })->first();

        $groups = Group::whereHas('schools', function ($query) use ($current_school) {
            $query->where('school_id', '=', $current_school->id);
        })->get();

        $schedules = Schedule::where('school_id', $current_school->id)
            ->where('group_id', $current_group->id)
            ->with('lessons')
            ->get();

        return view('admin.schedules.show', compact('list_schools', 'schedules', 'current_school', 'current_group' ,'groups'));
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
}
