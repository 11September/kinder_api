<?php

namespace App;

use Illuminate\Support\Facades\Hash;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    const ADMIN_TYPE = 'admin';
    const DEFAULT_TYPE = 'default';

    protected $table = "users";

    protected $fillable = [
        'name', 'email', 'push', 'type', 'parent_name', 'parent_phone', 'parents', 'address', 'birthday', 'school_id', 'group_id', 'status', 'password', 'token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */

    protected $hidden = [
        'password', 'remember_token', 'role_id', 'token'
    ];

    public function changeToken()
    {
        return $this->token = Hash::make(time());
    }

    public function email()
    {
        return $this->email;
    }

    public function getUserToken()
    {
        return $this->token;
    }

    public function school()
    {
        return $this->belongsTo(School::class);
    }

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function electives()
    {
        return $this->belongsToMany(Electivy::class, 'elective_groups')->withTimestamps();
    }
}
