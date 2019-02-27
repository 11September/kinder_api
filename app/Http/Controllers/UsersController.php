<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function SetPushEnable(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'push' => [
                'required',
                'string',
                Rule::in(['true']),
            ]
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('id', $request->user_id)->first();
            $user->push_chat = $request->push;
            $user->save();

            return response()->json(['message' => 'Push повiдомлення змiнено!', 'data' => $user->push_chat], 200);

        } catch (\Exception $exception) {
            Log::warning('UsersController@SetPushEnable Exception: ' . $exception->getMessage() . " - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
