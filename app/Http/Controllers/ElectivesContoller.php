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
            $groups = Electivy::select('id', 'name', 'title', 'description', 'time')
                ->with('photos')
                ->get();

            return ['data' => $groups];

        } catch (\Exception $exception) {
            Log::warning('ElectivesContoller@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
