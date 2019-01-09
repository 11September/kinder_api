<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = "posts";

    protected $fillable = ['title', 'body', 'image', 'preview'];
    protected $dates = ['created_at'];


    public function getCreatedAtAttribute($date)
    {
        return $this->attributes['created_at'] = Carbon::parse($date)->toDateString();
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function groups()
    {
        return $this->belongsToMany(Group::class, 'post_groups')->withTimestamps();
    }

    public function scopePublished($query)
    {
        return $query->where('status', '=', 'PUBLISHED');
    }

    public function scopeFilter($query, $params)
    {
        if ($id = array_get($params, 'id')) {
            $query = $query->where('id', '=', $id);
        }

        return $query;
    }
}
