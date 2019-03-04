<?php

namespace App\Http\Controllers\App;

use App\User;
use App\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class SchedulesController
{
    public function index(Request $request)
    {
        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            if (!$user->school_id || !$user->group_id) {
                return response()->json(['message' => 'Розклад не знайдено!'], 404);
            }

            $schedules = Schedule::where('school_id', $user->school_id)
                ->where('group_id', $user->group_id)
                ->with(array('lessons' => function ($query) {
                    $query->select('id', 'name', 'from', 'to', 'schedule_id');
                }))
                ->get();

            foreach ($schedules as $key => $value) {
                if (count($value->lessons) < 1) {
                    $schedules->forget($key);
                }
            }

            if (!$schedules || count($schedules) < 1) {
                return response()->json(['message' => 'В даний момент розклад відсутній!'], 404);
            }

            return ['data' => $schedules];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
