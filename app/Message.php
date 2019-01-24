<?php

namespace App;

use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;

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

    public function getSelfMessageAttribute()
    {
        dd($this->user()->id, Auth::user(), $this->user_id, Auth::id(), auth()->id());
        return $this->user_id === auth()->id();
    }
}
