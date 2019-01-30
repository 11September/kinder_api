<?php

namespace App\Http\Controllers;

use App\Conversation;
use App\User;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StoreGroup;
use App\Http\Requests\UpdateGroup;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Config;

class GroupController extends Controller
{
    public function GroupUsers(Request $request)
    {
        try {
            $group_id = null;
            $current_user_id = null;

            $user = User::select('id', 'group_id')->where('token', '=', $request->header('x-auth-token'))->with('group')->first();
            $current_user_id = $user->id;

            if (!$user->group_id || !isset($user->group_id)) {
                $group = Group::where('user_id', $user->id)->OrWhere('moderator_id', $user->id)->first();

                if (!$group) {
                    return response()->json(['message' => 'Користувачів не знайдено!'], 404);
                }

                $group_id = $group->id;
            } else {
                $group_id = $user->group_id;
            }

            $users = User::select('id', 'name', 'parent_name', 'birthday', 'avatar', 'type', 'parents')
                ->where('group_id', '=', $group_id)
                ->where('type', 'default')
                ->active()
                ->where('id', '!=', $current_user_id)
                ->get();

            foreach ($users as $item) {
                if (!$item->avatar || empty($item->avatar)) {
                    $item->avatar;
                } else {
                    $item->avatar = Config::get('app.url') . $item->avatar;
                }

                if ($item->parents == 'father') {
                    $item->parents = "Батько";
                }
                if ($item->parents == 'mother') {
                    $item->parents = "Мати";
                }
            }

            $group = Group::select('id', 'user_id', 'moderator_id')->where('id', $group_id)
                ->with(array
                    ('admin' => function ($query) {
                            $query->select('id');
                        })
                )
                ->with(array
                    ('moderator' => function ($query) {
                            $query->select('id');
                        })
                )
                ->first();

//            dd($group);

            $adminId = $group->admin->id;
            $moderId = $group->moderator->id;

            $admins_group = User::select('id', 'name', 'parent_name', 'birthday', 'avatar', 'type', 'parents')
                ->where('type', '!=', 'default')
                ->whereIn('id', [$adminId, $moderId])
                ->where('id', '!=', $current_user_id)
                ->get();

            foreach ($admins_group as $item) {
                if (!$item->avatar || empty($item->avatar)) {
                    $item->avatar;
                } else {
                    $item->avatar = Config::get('app.url') . $item->avatar;
                }

                if ($item->parents == 'father') {
                    $item->parents = "Батько";
                }
                if ($item->parents == 'mother') {
                    $item->parents = "Мати";
                }
            }

            $group_users = $admins_group->merge($users);

            if (!$group_users || count($group_users) < 1) {
                return response()->json(['message' => 'Користувачів не знайдено!'], 404);
            }

//            $group_users->load('messages');

            foreach ($group_users as $user) {
                $count = 0;

                $conversations = Conversation::where('user1_id', $user->id)->where('user2_id', $user->id)->with('messages')->get();


                if (isset($conversations->messages)){

                    dd("isset");

                    foreach ($conversations->messages as $message) {

                        dd("message" ,$message);

                        if ($message->user_id != $user->id){
                            $count++;
                        }
                    }
                }

                $user->count = $count;
            }

            dd($group_users);




            foreach ($group_users as $user) {
                $count = 0;
//                foreach ($user->messages as $message) {
//                    if ($message->status == "unread") {
//                        $count++;
//                    }
//                }

//                unset($user->messages);
                $user->count = $count;
            }

            return ['data' => $group_users];

        } catch (\Exception $exception) {
            Log::warning('GroupController@GroupUsers Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
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

        return response()->json(['data' => $groups, 'success' => true]);
    }

    public function adminIndex()
    {
        $admins = User::select('id', 'name')->where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::withCount(['students'])
            ->with('admin')
            ->with('moderator')
            ->with('schools')
            ->get();

        $moderators_ids = array();
        foreach ($groups as $key => $group) {
            $moderators_ids[$key] = $group->moderator_id;
        }

        $moderators = User::select('id', 'name')
            ->where('type', 'moderator')
            ->whereNotIn('id', $moderators_ids)
            ->get();

        return view('admin.groups', compact('admins', 'moderators', 'schools', 'groups'));
    }

    public function adminStore(StoreGroup $request)
    {
        $group = new Group();
        $group->name = $request->name;
        $group->user_id = $request->user_id;
        $group->moderator_id = $request->moderator_id;

        $group->save();

        $group->schools()->attach($request->school_id);

        $user = User::where('id', $request->moderator_id)->first();
        $user->school_id = $request->school_id;
        $user->group_id = $group->id;
        $user->save();

        return redirect()->route('admin.groups')->with('message', 'Група успішно додана!');
    }

    public function adminEdit($id)
    {
        $admins = User::select('id', 'name')->where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::withCount(['students'])->get();

        $group = Group::where('id', $id)->withCount(['students'])->with('schools')->first();

        $moderators_ids = array();
        foreach ($groups as $key => $item) {
            if ($item->moderator_id == $group->moderator_id){
                continue;
            }else{
                $moderators_ids[$key] = $item->moderator_id;
            }
        }

        $moderators = User::select('id', 'name')
            ->where('type', 'moderator')
            ->whereNotIn('id', $moderators_ids)
            ->get();

        return view('admin.groups.edit', compact('admins', 'moderators', 'schools', 'group', 'groups'));
    }

    public function adminUpdate(UpdateGroup $request, $id)
    {
        $group = Group::where('id', $id)->first();
        $user = User::where('id', $group->moderator_id)->first();

        $group->schools()->sync($request->school_id);

        $group->name = $request->name;
        $group->user_id = $request->user_id;
        $group->moderator_id = $request->moderator_id;

        $group->save();

        if ($user->id != $request->moderator_id){
            $user->school_id = null;
            $user->group_id = null;
            $user->save();

            $user = User::where('id', $request->moderator_id)->first();
            $user->school_id = $request->school_id;
            $user->group_id = $group->id;
            $user->save();
        }

        return redirect()->route('admin.groups')->with('message', 'Група успішно оновлена!');
    }

    public function adminDelete($id)
    {
        $group = Group::where('id', $id)->first();

        $group->schools()->detach();
        $group->posts()->detach();

        $user = User::where('id', $group->moderator_id)->first();
        $user->school_id = null;
        $user->group_id = null;
        $user->save();

        $group->delete();

        return redirect()->route('admin.groups')->with('message', 'Група успішно видалена!');
    }
}
