<?php

namespace App;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Message extends Model
{
    protected $fillable = ['body', 'status'];

    protected $appends = ['selfMessage'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function conversation()
    {
        return $this->belongsTo(Conversation::class);
    }

    public function getSelfMessageAttribute(Request $request)
    {
        $user = User::where('token', '=', $request->header('x-auth-token'))->first();

        dd($user, Auth::user(), $this->user_id, Auth::id(), auth()->id());
        return $this->user_id === auth()->id();
    }
}
