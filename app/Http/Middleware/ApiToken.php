<?php
namespace App\Http\Middleware;
use Closure;
use App\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = User::where('token', '=', $request->header('x-auth-token'))->first();
        if($token && $request->header('x-auth-token')){
            return $next ($request);
        }else{
            User::where('token', '=', $request->header('x-auth-token'))->update(['player_id' => null]);
            return response()->json(['message' => 'Невідповідність токена або користувач не авторизований!'], 403);
        }
    }
}
