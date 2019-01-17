<?php

namespace App\Http\Controllers;

use App\Food;
use App\School;
use App\Schedule;
use App\Nutrition;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class NutritionsController extends Controller
{
    public function index($school_id)
    {
        if (!$school_id || empty($school_id) || !is_numeric($school_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $schedule = Nutrition::where('school_id', $school_id)
                ->with(array('foods' => function ($query) {
                    $query->select('id', 'name', 'type', 'nutrition_id');
                    $query->orderByRaw("FIELD(type, \"breakfast\", \"lunch\", \"afternoon-tea\", \"dinner\")");
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

        $schedules = Nutrition::with('foods')->with('school')->get()->groupBy('school_id');

        return view('admin.nutritions', compact('list_schools', 'schedules'));
    }

    public function adminShow($id)
    {
        $list_schools = School::all();

        $schedules = Nutrition::where('school_id', $id)
            ->with(['foods' => function($query){
                $query->orderByRaw("FIELD(type, \"breakfast\", \"lunch\", \"afternoon-tea\", \"dinner\")");
            }])
            ->get();

//        dd($schedules);

        $current_school = School::where('id', $id)->first();

        return view('admin.nutritions.show', compact('list_schools', 'schedules', 'current_school'));
    }

    public function adminGetFoodsByDay(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
            'day' => 'required',
        ]);

        $schedules = Nutrition::where('school_id', $request->school_id)->where('day', $request->day)
            ->with(['foods' => function($query){
                $query->orderByRaw("FIELD(type, \"breakfast\", \"lunch\", \"afternoon-tea\", \"dinner\")");
            }])
            ->first();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminGetFoodsAll(Request $request)
    {
        $request->validate([
            'school_id' => 'required',
        ]);

        $schedules = Nutrition::where('school_id', $request->school_id)
            ->with(['foods' => function($query){
                $query->orderByRaw("FIELD(type, \"breakfast\", \"lunch\", \"afternoon-tea\", \"dinner\")");
            }])
            ->get();

        return response()->json(['data' => $schedules, 'success' => true]);
    }

    public function adminSaveFoodByDay(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'type' => 'required',

            'school_id' => 'required',
            'day' => 'required',
            'schedule_id' => '',
            'lesson_id' => '',
        ]);

        if ($request->lesson_id) {
            $food = Food::where('id', $request->lesson_id)->first();
            $food->name = $request->name;
            $food->type = $request->type;
            $food->save();
        } else {
            if ($request->schedule_id) {
                $nutrition = Nutrition::where('id', $request->schedule_id)->first();

                $food = Food::where('nutrition_id', $nutrition->id)->first();
                $food->name = $request->name;
                $food->type = $request->type;
                $food->save();

            } else {
                $nutrition = Nutrition::where('school_id', $request->school_id)->where('day', $request->day)->first();

                if ($nutrition) {
                    $food = new Food();
                    $food->nutrition_id = $nutrition->id;
                    $food->name = $request->name;
                    $food->type = $request->type;
                    $food->save();
                } else {
                    $nutrition = new Nutrition();
                    $nutrition->school_id = $request->school_id;
                    $nutrition->day = $request->day;
                    $nutrition->save();

                    $food = new Food();
                    $food->nutrition_id = $nutrition->id;
                    $food->name = $request->name;
                    $food->type = $request->type;
                    $food->save();
                }
            }
        }

        return response()->json(['success' => true, 'id' => $food->id]);
    }

    public function adminDeleteFoodByDay(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $food = Food::where('id', $request->id)->first();
        $food->delete();

        return response()->json(['success' => true]);
    }
}
