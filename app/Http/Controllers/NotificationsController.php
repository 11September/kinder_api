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
        $notification = new Notification();
        $notification->title = $request->title;
        $notification->message = $request->message;
        $notification->save();

        $notification->groups()->sync($request->group_id, false);
        $notification->schools()->sync($request->school_id, false);

        $user = User::whereNotNull('player_id')->first();

        \OneSignal::sendNotificationUsingTags(
            "Some Message",
            array(
                ["field" => "email", "relation" => "=", "value" => $user->email],
                ["field" => "email", "relation" => "=", "value" => "email1@example.com"],
            ),
            $url = null,
            $data = null,
            $buttons = null,
            $schedule = null
        );

        return redirect()->route('admin.notifications')->with('message', 'Повiдомлення успішно додано!');
    }
}
