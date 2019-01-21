<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $table = "groups";
    protected $fillable = ['name', 'user_id', 'school_id'];

    public function schools()
    {
        return $this->belongsToMany(School::class)->withTimestamps();
    }

    public function students()
    {
        return $this->hasMany(User::class);
    }

    public function posts()
    {
        return $this->belongsToMany(Post::class, 'post_groups');
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
