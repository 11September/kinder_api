<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Nutrition extends Model
{
    protected $table = "nutritions";

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function foods()
    {
        return $this->hasMany(Food::class);
    }
}
