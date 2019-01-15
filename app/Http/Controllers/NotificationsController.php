<?php

namespace App\Http\Controllers;

use App\User;
use OneSignal;
use App\Group;
use App\School;
use App\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\StoreNotification;

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
            Log::warning('GroupController@index Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function adminIndex()
    {
        $schools = School::all();

        return view('admin.notifications', compact('schools'));
    }

    public function adminStore(StoreNotification $request)
    {
//        $notification = new Notification();
//        $notification->title = $request->title;
//        $notification->message = $request->message;
//        $notification->save();
//
//        $notification->groups()->sync($request->group_id, false);
//        $notification->schools()->sync($request->school_id, false);
//
//        $user = User::whereNotNull('player_id')->first();

        $params = [];
        $params['headings'] = [
            "en" => $request->title
        ];
        $params['contents'] = [
            "en" => $request->message
        ];

        if ($request->all && $request->all == "all") {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->get();

            $player_ids = array();
            foreach ($users as $user) {
                $player_ids[] = $user->player_id;
            }

            if ($player_ids && !empty($player_ids)) {
                $params['include_player_ids'] = $player_ids;
                \OneSignal::sendNotificationCustom($params);
            }
        } else {

            dd('else');

            //        Else school_ids and group_ids

            $params = [];
            $params['include_player_ids'] = array("e903b975-66a8-4f32-a34e-587ad0c0bc40", "1b96389f-51aa-4e8f-83a2-0f21ca926831");

            $params['headings'] = [
                "en" => $request->title
            ];
            $params['contents'] = [
                "en" => $request->message
            ];

            \OneSignal::sendNotificationCustom($params);
        }

        return redirect()->route('admin.notifications')->with('message', 'Повiдомлення успішно відправлено!');
    }
}
