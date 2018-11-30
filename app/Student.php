<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $table = "students";

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function users()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 'ACTIVE');
    }

    public function scopeFilter($query, $params)
    {
        if ($id = array_get($params, 'id')) {
            $query = $query->where('id', '=', $id);
        }
        if ($FIO = array_get($params, 'FIO')) {
            $query = $query->where('FIO', '=', $FIO);
        }
        if ($status = array_get($params, 'status')) {
            $query = $query->where('status', '=', $status);
        }
        return $query;
    }
}
