<?php

namespace App\Http\Controllers;

use App\User;
use App\Mail\ResetPassword;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255',
            'password' => 'required|string|min:6|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            if (Auth::user()) {
                $user = Auth::user();
                $group = $user->group()->first();

                $user->changeToken();
                $user->save();

                $result = array();
                $result = array_add($result, 'token', $user->token);
                $result = array_add($result, 'parent_name', $user->parent_name);
                $result = array_add($result, 'email', $user->email);
                $result = array_add($result, 'avatar', $user->avatar);
                $result = array_add($result, 'group', $group->name);

                return response($result);
            }

            $user = User::where('email', $request->email)->first();
            if ($user) {
                if (Hash::check($request->password, $user->password)) {
                    if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
                        $group = $user->group()->first();

                        $user->changeToken();
                        $user->save();

                        $result = array();
                        $result = array_add($result, 'token', $user->token);
                        $result = array_add($result, 'parent_name', $user->parent_name);
                        $result = array_add($result, 'email', $user->email);
                        $result = array_add($result, 'avatar', $user->avatar);
                        $result = array_add($result, 'group', $group->name);
                        return response($result);
                    } else {
                        return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
                    }
                }
            }

            return response()->json(['message' => 'Користувача немає або логін / пароль не підходять'], 401);

        } catch (\Exception $exception) {
            Log::warning('UsersController@login Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function logout()
    {
        try {
            Auth::logout();

            return response()->json(['success' => true], 200);

        } catch (\Exception $exception) {
            Log::warning('UsersController@logout Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function generatePassword($length = 8)
    {
        $chars = 'abdefhiknrstyzABDEFGHKNQRSTYZ23456789';
        $numChars = strlen($chars);
        $string = '';
        for ($i = 0; $i < $length; $i++) {
            $string .= substr($chars, rand(1, $numChars) - 1, 1);
        }
        return $string;
    }


    public function ResetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
        ]);

        $validator_exist = Validator::make($request->all(), [
            'email' => 'exists:users,email',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        if ($validator_exist->fails()) {
            return response()->json(['message' => 'Користувача не існує!'], 404);
        }

        try {
            $user = User::where('email', $request->email)->first();
            $new_password = $this->generatePassword();
            $user->password = bcrypt($new_password);

            \Mail::to($request->email)->send(new ResetPassword($user, $new_password));

            $user->save();

            return response()->json(['message' => 'Перевірте пошту з новим паролем!'], 200);
        } catch (\Exception $exception) {
            Log::warning('UsersController@resetPassword Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }


    public function ChangePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password_old' => 'required|string|min:6|max:255',
            'password' => 'required|string|min:6|max:255',
            'password_confirmation' => 'required|string|min:6|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        if ($request->password !== $request->password_confirmation) {
            return response()->json(['message' => 'Паролі не співпадають!'], 422);
        }

        $user = User::where('token', '=', $request->header('x-auth-token'))->first();

        if (Hash::check($request->password_old, $user->password)) {
            $user->password = Hash::make($request->password);
            $user->save();

            return response()->json(['message' => 'Пароль змінений!'], 200);
        } else {
            return response()->json(['message' => 'Старий пароль невірний!'], 422);
        }
    }

    public function profile(Request $request)
    {
        try {

            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            $result = array();
            $result = array_add($result, 'name', $user->name);
            $result = array_add($result, 'email', $user->email);
            $result = array_add($result, 'avatar', $user->avatar);
            $result = array_add($result, 'push', $user->push);
            $result = array_add($result, 'token', $user->token);

            return response($result);
        } catch (\Exception $exception) {
            Log::warning('UsersController@resetPassword Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function SetAvatar(Request $request)
    {
//        $validator = Validator::make($request->all(), [
//            'avatar' => 'required',
//        ]);
//
//        if ($validator->fails()) {
//            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
//        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

            $preview = $request->file('avatar');
            $input['avatar'] = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
            $preview->move(public_path('/images/uploads/avatars'), $input['avatar']);
            $user->avatar = '/images/uploads/avatars/' . $input['preview'];

            $user->save();

            return response()->json(['message' => 'Аватар змінено!'], 200);

        } catch (\Exception $exception) {
            Log::warning('UsersController@SetAvatar Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

}
