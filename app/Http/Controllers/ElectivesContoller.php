<?php

namespace App\Http\Controllers;

use App\Electivy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ElectivesContoller extends Controller
{
    public function index(Request $request)
    {
        try {
            $electives = Electivy::select('id', 'name', 'title', 'description', 'time-start', 'time-end')
                ->orderBy('time-start')
                ->get();

            return ['data' => $electives];

        } catch (\Exception $exception) {
            Log::warning('ElectivesContoller@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function show(Request $request, $id = null)
    {
        try {
            $elective = Electivy::select('id', 'name', 'title', 'description', 'time')
                ->where('id', $id)
                ->with('photos')
                ->get();

            return ['data' => $elective];

        } catch (\Exception $exception) {
            Log::warning('ElectivesContoller@show Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
