<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    protected $table = 'foods';

    public function nutrition()
    {
        return $this->belongsTo(Nutrition::class);
    }

    public function hasNutrition(){
        return (bool) $this->nutrition()->first();
    }
}
