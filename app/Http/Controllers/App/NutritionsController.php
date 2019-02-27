<?php

namespace App\Http\Controllers\App;

use App\Nutrition;
use Illuminate\Support\Facades\Log;

class NutritionsController
{
    public function index($school_id)
    {
        if (!$school_id || empty($school_id) || !is_numeric($school_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $schedules = Nutrition::where('school_id', $school_id)
                ->with(array('foods' => function ($query) {
                    $query->select('id', 'name', 'type', 'nutrition_id');
                    $query->orderByRaw("FIELD(type, \"breakfast\", \"lunch\", \"afternoon-tea\", \"dinner\")");
                }))
                ->get();

            if (!$schedules || count($schedules) < 1) {
                return response()->json(['message' => 'В даний момент меню харчування відсутнє!'], 404);
            }else{
                foreach ($schedules as $key => $value) {
                    if (count($value->foods) < 1){
                        $schedules->forget($key);
                    }
                }
            }

            return ['data' => $schedules];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
