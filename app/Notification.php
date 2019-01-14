<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $table = "notifications";

    protected $fillable = ['title', 'message'];

    public function groups()
    {
        return $this->belongsToMany(Group::class, "notification_groups")->withTimestamps();
    }

    public function schools()
    {
        return $this->belongsToMany(School::class, 'notification_schools')->withTimestamps();
    }
}
