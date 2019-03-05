<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WelcomeController extends Controller
{
    public function welcome()
    {
        return view('welcome');
    }

    public function redirect()
    {
        Auth::logout();
        return redirect()->route('welcome');
    }
}
