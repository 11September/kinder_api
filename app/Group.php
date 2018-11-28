<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $table = "groups";

    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
