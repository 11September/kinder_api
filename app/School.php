<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    protected $table = 'schools';

    protected $guarded = [];
    protected $dates = ['created_at'];

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function students()
    {
        return $this->hasMany(User::class);
    }

    public function schedules()
    {
        return $this->hasMany(Schedule::class);
    }

    public function nutritions()
    {
        return $this->hasMany(Nutrition::class);
    }

    public function groups()
    {
        return $this->hasMany(Group::class);
    }

    public function getFirstGroupAttribute() {
        return $this->groups()->first();
    }

    public function first_group() {
        return $this->groups()->take(1);
    }

    public function getCreatedAtAttribute($date)
    {
        return $this->attributes['created_at'] = Carbon::parse($date)->toDateString();
    }

    public function scopePublished($query)
    {
        $query->where('status', '=', 'PUBLISHED');
    }

    public function scopeFilter($query, $params)
    {
        if ($id = array_get($params, 'id')) {
            $query = $query->where('id', '=', $id);
        }
        if ($name = array_get($params, 'name')) {
            $query = $query->where('name', '=', $name);
        }

        return $query;
    }

}
