<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Clas extends Model
{
    protected $table = 'classes';

    public function getFromAttribute($value) {
        return $this->attributes['from'] = (new Carbon($value))->format('H:i');
    }

    public function getToAttribute($value) {
        return $this->attributes['to'] = (new Carbon($value))->format('H:i');
    }
}
