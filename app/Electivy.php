<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Electivy extends Model
{
    protected $table = "electives";

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function photos()
    {
        return $this->hasMany(ElectivyPhoto::class);
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 'ACTIVE');
    }
}
