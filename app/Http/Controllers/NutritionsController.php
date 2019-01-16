<?php

namespace App\Http\Controllers;

use App\Nutrition;
use App\Schedule;
use App\School;
use Illuminate\Http\Request;

class NutritionsController extends Controller
{
    public function index($school_id)
    {
        if (!$school_id || empty($school_id)) {
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

        return view('admin.nutritions', compact('list_schools'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $schedules = Nutrition::where('school_id', $id)->with('foods')->get();

        dd($schedules);

        $current_school = School::where('id', $id)->first();

        return view('admin.nutritions.show', compact('list_schools', 'schedules', 'current_school'));
    }
}
