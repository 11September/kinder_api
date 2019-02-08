<?php

namespace App\Http\Controllers;

use App\User;
use App\Group;
use App\School;
use App\Conversation;
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
            $user = User::select('id', 'group_id')->where('token', '=', $request->header('x-auth-token'))->with('group')->first();
            $current_user_id = $user->id;

            $users = User::select('id', 'name', 'parent_name', 'birthday', 'avatar', 'type', 'parents')
                ->where('id', '!=', $user->id)
                ->where('group_id', '=', $user->group_id)
                ->where('type', '!=', 'admin')
                ->active()
                ->orderByRaw("FIELD(type , 'moderator', 'default') ASC")
                ->get();

            $group = Group::select('id', 'user_id')->where('id', $user->group_id)->first();

            $admin_group = User::select('id', 'name', 'parent_name', 'birthday', 'avatar', 'type', 'parents')
                ->where('type', '=', 'admin')
                ->where('id', '=', $group->user_id)
                ->active()
                ->get();

            $group_users = $admin_group->merge($users);

            if (!$group_users || count($group_users) < 1) {
                return response()->json(['message' => 'В даний момент користувачів не знайдено!'], 404);
            }

            foreach ($group_users as $user) {
                if (!$user->avatar || empty($user->avatar)) {
                    $user->avatar;
                } else {
                    $user->avatar = Config::get('app.url') . $user->avatar;
                }

                if ($user->parents == 'father') {
                    $user->parents = "Батько";
                }
                if ($user->parents == 'mother') {
                    $user->parents = "Мати";
                }

                $count = 0;

                $conversations = Conversation::where([
                    ['user1_id', '=', $user->id],
                    ['user2_id', '=', $current_user_id]
                ])->OrWhere([
                    ['user1_id', '=', $current_user_id],
                    ['user2_id', '=', $user->id]
                ])->with('messages')->get();

                foreach ($conversations as $conversation) {
                    foreach ($conversation->messages as $message) {
                        if ($message->user_id != $current_user_id && $message->status == "unread") {
                            $count++;
                        }
                    }
                }

                $user->count = $count;
            }

            return ['data' => $group_users];

        } catch (\Exception $exception) {
            Log::warning('GroupController@GroupUsers Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function GroupUsersCounters(Request $request)
    {
        try {
            $user = User::select('id', 'group_id')->where('token', '=', $request->header('x-auth-token'))->with('group')->first();
            $current_user_id = $user->id;

            $users = User::select('id')
                ->where('id', '!=', $user->id)
                ->where('group_id', '=', $user->group_id)
                ->where('type', '!=', 'admin')
                ->active()
                ->orderByRaw("FIELD(type , 'moderator', 'default') ASC")
                ->get();

            $group = Group::select('id', 'user_id')->where('id', $user->group_id)->first();

            $admin_group = User::select('id')
                ->where('type', '=', 'admin')
                ->where('id', '=', $group->user_id)
                ->active()
                ->get();

            $group_users = $admin_group->merge($users);

            if (!$group_users || count($group_users) < 1) {
                return response()->json(['message' => 'Користувачів не знайдено!'], 404);
            }

            foreach ($group_users as $user) {
                $count = 0;

                $conversations = Conversation::where([
                    ['user1_id', '=', $user->id],
                    ['user2_id', '=', $current_user_id]
                ])->OrWhere([
                    ['user1_id', '=', $current_user_id],
                    ['user2_id', '=', $user->id]
                ])->with('messages')->get();

                foreach ($conversations as $conversation) {
                    foreach ($conversation->messages as $message) {
                        if ($message->user_id != $current_user_id && $message->status == "unread") {
                            $count++;
                        }
                    }
                }

                $user->count = $count;
            }

            return ['data' => $group_users];

        } catch (\Exception $exception) {
            Log::warning('GroupController@GroupUsersCounters Exception: ' . $exception->getMessage() . "line - " . $exception->getLine());
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

        $groups = Group::with('admin')
            ->with('schools')
            ->with('students')
            ->get();

        $moderators = User::select('id', 'name')
            ->where('type', 'moderator')
            ->where('school_id', null)
            ->where('group_id', null)
            ->active()
            ->get();

        return view('admin.groups', compact('admins', 'moderators', 'schools', 'groups'));
    }

    public function adminStore(StoreGroup $request)
    {
        $group = new Group();
        $group->name = $request->name;
        $group->user_id = $request->user_id;

        $group->save();

        $group->schools()->attach($request->school_id);

        foreach ($request->moderator_id as $value) {
            $user = User::where('id', $value)
                ->where('school_id', null)
                ->where('group_id', null)
                ->active()
                ->first();

            $user->school_id = $request->school_id;
            $user->group_id = $group->id;
            $user->type = "moderator";
            $user->save();
        }

        return redirect()->route('admin.groups')->with('message', 'Група успішно додана!');
    }

    public function adminEdit($id)
    {
        $admins = User::select('id', 'name')->where('type', 'admin')->get();

        $schools = School::all();

        $groups = Group::with('students')->get();

        $group = Group::where('id', $id)->with('students')->with('schools')->first();

        $moderators_ids = array();
        foreach ($group->students as $key => $student) {
            if ($student->type == "moderator") {
                $moderators_ids[$key] = $student->id;
            }
        }

        $currentModerators = User::select('id', 'name', 'group_id')
            ->where('type', 'moderator')
            ->whereIn('id', $moderators_ids)
            ->active()
            ->get();

        $availableModerators = User::select('id', 'name', 'group_id')
            ->where('type', 'moderator')
            ->where('school_id', null)
            ->where('group_id', null)
            ->active()
            ->get();

        $moderators = $currentModerators->merge($availableModerators);

        return view('admin.groups.edit', compact('admins', 'moderators', 'schools', 'group', 'groups'));
    }

    public function adminUpdate(UpdateGroup $request, $id)
    {
        $group = Group::where('id', $id)->first();

        $group->schools()->sync($request->school_id);

        $group->name = $request->name;
        $group->user_id = $request->user_id;

        $group->save();

        User::where('type', 'moderator')->where('group_id', $group->id)->update(['group_id' => null, 'school_id' => null]);
        User::where('type', 'moderator')->whereIn('id', $request->moderator_id)->update(['group_id' => $group->id, 'school_id' => $request->school_id]);

        return redirect()->route('admin.groups')->with('message', 'Група успішно оновлена!');
    }

    public function adminDelete($id)
    {
        $group = Group::where('id', $id)->first();

        $group->schools()->detach();
        $group->posts()->detach();

        $users = User::where('group_id', $group->id)->where('type', 'moderator')->get();
        foreach ($users as $item) {
            $user = User::where('id', $item->id)->first();
            $user->school_id = null;
            $user->group_id = null;
            $user->type = "moderator";
            $user->save();
        }

        $group->delete();

        return redirect()->route('admin.groups')->with('message', 'Група успішно видалена!');
    }
}
