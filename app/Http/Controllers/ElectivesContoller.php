<?php

namespace App\Http\Controllers;

use App\Electivy;
use App\Group;
use App\School;
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
            Log::warning('ElectivesContoller@index Exception: ' . $exception->getMessage());
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
            Log::warning('ElectivesContoller@show Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function adminIndex()
    {
        $electives = Electivy::with(array('school' => function ($query) {
            $query->select('id', 'name');
        }))->latest()->get();

        return view('admin.electives', compact('electives'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        $groups = Group::all();

        return view('admin.electives.create', compact('schools', 'groups'));
    }


    public function adminStore(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'school_id' => 'required',
            'group_id' => 'required',
            'time_start' => 'required',
            'time_end' => 'required',
        ]);

        $elective = new Electivy();
        $elective->name = $request->name;
        $elective->school_id = $request->school_id;
        $elective->time_start = $request->time_start;
        $elective->time_end = $request->time_end;

        $elective->save();

        $elective->groups()->sync($request->group_id, false);

        return redirect()->route('admin.electives')->with('message', 'Кружек успешно добавлен!');
    }

    public function adminEdit($id)
    {
        $electivy = Electivy::where('id', $id)->with('groups')->first();

        $schools = School::all();

        $groups = Group::all();

        return view('admin.electives.edit', compact('electivy', 'schools', 'groups'));
    }

    public function adminUpdate(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'school_id' => 'required',
            'group_id' => 'required',
            'time_start' => 'required',
            'time_end' => 'required',
        ]);

        $elective = Electivy::where('id', $id)->first();
        $elective->name = $request->name;
        $elective->school_id = $request->school_id;
        $elective->time_start = $request->time_start;
        $elective->time_end = $request->time_end;
        $elective->save();

        $elective->groups()->sync($request->group_id, true);

        return redirect()->route('admin.electives')->with('message', 'Кружек успешно добавлен!');
    }

    public function adminDelete($id)
    {
        $electivy = Electivy::find($id);
        $electivy->groups()->detach();
        $electivy->delete();

        return redirect()->back()->with('success', 'Кружек успешно удалён!');
    }
}
