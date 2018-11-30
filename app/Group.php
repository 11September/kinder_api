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

    public function students()
    {
        return $this->hasMany(Student::class);
    }

    public function scopeFilter($query, $params)
    {
        if ($id = array_get($params, 'id')) {
            $query = $query->where('id', '=', $id);
        }
        if ($title = array_get($params, 'name')) {
            $query = $query->where('name', '=', $title);
        }
        if ($school_id = array_get($params, 'school_id')) {
            $query = $query->where('school_id', '=', $school_id);
        }

        return $query;
    }
}
