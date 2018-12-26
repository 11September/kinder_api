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

    public function adminIndex()
    {
        $users = User::where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::all();

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
        $group->school_id = $request->school_id;

        $group->save();

        return redirect()->route('admin.groups')->with('message','Группа успешно добавлена!');
    }

    public function adminEdit($id)
    {
        $users = User::where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::all();

        $group = Group::where('id', $id)->first();

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
            'school_id' => $request->school_id,
        ]);

        $group->save();

        return redirect()->route('admin.groups')->with('message','Группа успешно обновлена!');
    }

    public function adminDelete($id)
    {
        $group = Group::find($id);

        $group->delete();

        return redirect()->route('admin.groups')->with('message','Группа успешно удалена!');
    }
}
