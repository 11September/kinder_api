<?php

namespace App\Http\Controllers;

use App\User;
use OneSignal;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\StoreNotification;
use Illuminate\Support\Facades\Validator;

class NotificationsController extends Controller
{
    public function adminIndex()
    {
        $schools = School::all();

        return view('admin.notifications', compact('schools'));
    }

    public function adminStore(StoreNotification $request)
    {
        if ($request->all && $request->all == "all") {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->get();
        } else {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->whereIn('school_id', $request->school_id)
                ->whereIn('group_id', $request->group_id)
                ->get();
        }

        $player_ids = array();
        foreach ($users as $user) {
            $player_ids[] = $user->player_id;
        }

        if ($player_ids && !empty($player_ids)) {
            $params = [];
            $params['headings'] = [
                "en" => $request->title
            ];
            $params['contents'] = [
                "en" => $request->message
            ];
            $params['include_player_ids'] = $player_ids;
            \OneSignal::sendNotificationCustom($params);
        }

        return redirect()->route('notifications')->with('message', 'Повiдомлення успішно відправлено!');
    }

    public function notifyScheduleByGroup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'group_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->where('group_id', $request->group_id)
                ->get();

            $player_ids = array();
            foreach ($users as $user) {
                $player_ids[] = $user->player_id;
            }

            if ($player_ids && !empty($player_ids)) {
                $params = [];
                $params['headings'] = [
                    "en" => "Розклад"
                ];
                $params['contents'] = [
                    "en" => "Розклад занять в садку змінено. Перевірте новий розклад будь ласка!"
                ];
                $params['include_player_ids'] = $player_ids;
                $params['data'] = ["type" => "schedule"];
                \OneSignal::sendNotificationCustom($params);
            }

            return response()->json(['success' => true]);

        } catch (\Exception $exception) {
            Log::warning('NotificationsController@notifyScheduleByGroup Exception: ' . $exception->getMessage());
            return response()->json(['error' => true]);
        }
    }

    public function notifyFoodsBySchool(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->where('school_id', $request->id)
                ->get();

            $player_ids = array();
            foreach ($users as $user) {
                $player_ids[] = $user->player_id;
            }

            if ($player_ids && !empty($player_ids)) {
                $params = [];
                $params['headings'] = [
                    "en" => "Меню харчування"
                ];
                $params['contents'] = [
                    "en" => "Розклад харчування в садку змінено. Перевірте новий розклад будь ласка!"
                ];
                $params['include_player_ids'] = $player_ids;
                $params['data'] = ["type" => "foods"];
                \OneSignal::sendNotificationCustom($params);
            }

            return response()->json(['success' => true]);

        } catch (\Exception $exception) {
            Log::warning('NotificationsController@notifyFoodsBySchool Exception: ' . $exception->getMessage());
            return response()->json(['error' => true]);
        }
    }
}
