<?php

namespace App\Http\Controllers;

use App\Group;
use App\Notification;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class NotificationsController extends Controller
{
    public function index(Request $request)
    {
        try {
            $notifications = Notification::select('id', 'message', 'school_id')
                ->filter($request->all())
                ->get();

            return ['data' => $notifications];

        } catch (\Exception $exception) {
            Log::warning('GroupController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function adminIndex()
    {
        $schools = School::withCount(['groups'])->get();

        return view('admin.notifications',compact('schools'));
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
        $schools = School::withCount(['groups'])->get();

        $groups = Group::all();

        return view('admin.notifications.edit',compact( 'schools', 'groups'));
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
