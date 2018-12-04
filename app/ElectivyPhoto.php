<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ElectivyPhoto extends Model
{
    protected $table = "electivy_photos";

    public function electivies()
    {
        return $this->belongsTo(Electivy::class);
    }
}
