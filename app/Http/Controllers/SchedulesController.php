<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SchedulesController extends Controller
{
    public function adminIndex()
    {
        $schools = School::all();

        return view('admin.groups',compact('users', 'schools', 'groups'));
    }
}
