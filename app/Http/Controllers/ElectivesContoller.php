<?php

namespace App\Http\Controllers;

use App\Electivy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

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

    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $elective = Electivy::select('id', 'name', 'title', 'description', 'time-start', 'time-end')
                ->where('id', $request->id)
                ->with('photos')
                ->first();

            return ['data' => $elective];

        } catch (\Exception $exception) {
            Log::warning('ElectivesContoller@show Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function admin()
    {
        $electives = Electivy::select('id', 'name', 'school_id', 'time_start', 'time_end')->get();

        return view('admin.electives', compact('electives'));
    }

    public function adminCreate()
    {
        return view('admin.electives.create');
    }

    public function adminStore()
    {

    }

    public function adminShow()
    {
        
    }

    public function adminEdit(Electivy $electivy)
    {
        return view('admin.electives', compact('electivy'));
    }

    public function adminDelete($id)
    {
        $electivy = Electivy::find($id);
        $electivy->delete();

        return redirect()->back()->with('success', 'Successfully deleted!');
    }
}
