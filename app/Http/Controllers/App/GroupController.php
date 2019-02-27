<?php

namespace App\Http\Controllers\App;

use App\User;
use App\Group;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Config;

class GroupController
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
}
