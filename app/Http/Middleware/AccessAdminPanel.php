<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class AccessAdminPanel
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
        if (auth()->check()) {
            if (Auth::user()->type == 'admin' || Auth::user()->type == 'moderator') {
                return $next($request);
            }
        }
        return redirect('home');
    }
}
