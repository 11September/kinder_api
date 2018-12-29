<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $table = "notifications";

    protected $fillable = ['message'];

    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
