<?php

namespace App\Http\Controllers;

use App\User;
use App\Mail\ResetPassword;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use TCG\Voyager\Models\Setting;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'login' => 'required|string|max:255',
            'password' => 'required|string|min:6|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        if (Auth::user()) {
            $user = Auth::user();
            $result = array();
            $result = array_add($result, 'token', $user->token);
            return response($result);
        }

        $user = User::where('email', $request->email)->first();
        if ($user) {
            if (Hash::check($request->password, $user->password)) {
                if (Auth::attempt(['email' => $request->email, 'password' => $user->password])) {
                    $result = array();
                    $result = array_add($result, 'token', $user->token);
                    return response($result);
                } else {
                    return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
                }
            }
        }

        return response()->json(['message' => 'Користувача немає або логін / пароль не підходять'], 401);
    }



    public function logout()
    {
        try {
            Auth::logout();
        } catch (\Exception $exception) {
            Log::warning('UsersController@logout Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }

        return response()->json(['success' => true], 200);
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

}
