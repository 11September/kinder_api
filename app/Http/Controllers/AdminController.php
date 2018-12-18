<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function admin()
    {
        return view('admin.admin');
    }

    public function users()
    {
        return view('admin.users');
    }

    public function kindergartens()
    {
        return view('admin.kindergartens');
    }
}
