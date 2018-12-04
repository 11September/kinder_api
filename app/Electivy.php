<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Electivy extends Model
{
    protected $table = "electives";

    public function photos()
    {
        return $this->hasMany(ElectivyPhoto::class);
    }
}
