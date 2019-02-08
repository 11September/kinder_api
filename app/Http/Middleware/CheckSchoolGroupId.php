<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class CheckSchoolGroupId
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (auth()->check()) {
            if (Auth::user()->type == 'moderator' && !Auth::user()->school_id && !Auth::user()->group_id) {
                return $next($request);
            }
        }
        return redirect('admin')->with('error', 'Користувач не може брати участь в листуванні, так як він не прив\'язаний до жодної групи!');
    }
}
