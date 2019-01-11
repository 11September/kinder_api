<?php

namespace App\Http\Controllers;

use App\Group;
use App\School;
use App\User;
use function GuzzleHttp\Promise\all;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class GroupController extends Controller
{
    public function index(Request $request)
    {
        try {
            $groups = Group::select('id', 'name', 'number', 'school_id')
                ->filter($request->all())
                ->get();

            return ['data' => $groups];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function getAllGroupsById(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $groups = Group::whereHas('schools', function ($query) use ($request) {
            $query->where('school_id', '=', $request->id);
        })->get();

//        $groups = Group::where('school_id', $request->id)->get();

        return response()->json(['data'=> $groups, 'success'=>true]);
    }

    public function adminIndex()
    {
        $users = User::where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::withCount(['students'])->get();

        return view('admin.groups',compact('users', 'schools', 'groups'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'user_id' => 'required',
            'school_id' => 'required',
        ]);

        $group = new Group();
        $group->name = $request->name;
        $group->user_id = $request->user_id;

        $group->save();

        $group->schools()->attach($request->school_id);

        return redirect()->route('admin.groups')->with('message','Група успішно додана!');
    }

    public function adminEdit($id)
    {
        $users = User::where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::withCount(['students'])->get();

        $group = Group::where('id', $id)->withCount(['students'])->with('schools')->first();

        return view('admin.groups.edit',compact('users', 'schools', 'group', 'groups'));
    }

    public function adminUpdate(Request $request ,$id)
    {
        $request->validate([
            'name' => 'required',
            'user_id' => 'required',
            'school_id' => 'required',
        ]);

        $group = Group::where('id', $id)->first();

        $group->update([
            'name' => $request->name,
            'user_id' => $request->user_id,
        ]);

        $group->schools()->sync($request->school_id);

        $group->save();

        return redirect()->route('admin.groups')->with('message','Група успішно оновлена!');
    }

    public function adminDelete($id)
    {
        $group = Group::where('id', $id)->first();

        $group->schools()->detach();

        $group->delete();

        return redirect()->route('admin.groups')->with('message','Група успішно видалена!');
    }
}
