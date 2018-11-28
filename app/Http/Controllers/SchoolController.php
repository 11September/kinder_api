<?php
namespace App\Http\Controllers;

use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
class SchoolController extends Controller
{
    public function index(Request $request)
    {
        try {
            $dishes = School::select('id', 'name')
                ->filter($request)
                ->published()
                ->get();

        } catch (\Exception $exception) {
            Log::warning('DishesController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
        return response(['data' => $dishes]);
    }
}