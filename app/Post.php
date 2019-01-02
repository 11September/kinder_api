<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = "posts";

    protected $fillable = ['image'];
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
    public function scopeDraft($query)
    {
        return $query->where('status', '=', 'DRAFT');
    }
    public function scopePending($query)
    {
        return $query->where('status', '=', 'PENDING');
    }
    public function scopeFilter($query, $params)
    {
        if ($id = array_get($params, 'id')) {
            $query = $query->where('id', '=', $id);
        }
        if ($title = array_get($params, 'title')) {
            $query = $query->where('title', '=', $title);
        }
        if ($title_like = array_get($params, 'title_like')) {
            $query = $query->where('title', 'like', ('%' . $title_like . '%'));
        }
        if ($status = array_get($params, 'status')) {
            $query = $query->where('status', '=', $status);
        }
        return $query;
    }
}
