<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Users Auth
Route::post('login', 'UsersController@login')->name('Login');
Route::post('restore_password', 'UsersController@ResetPassword')->name('Restore Password');
Route::middleware('token')->post('change_password', 'UsersController@ChangePassword')->name('Change Password');
Route::middleware('token')->post('logout', 'UsersController@logout')->name('Logout');
// Users Auth

Route::middleware('token')->get('schools', 'SchoolController@index')->name('All Schools');
Route::middleware('token')->get('posts', 'PostsController@index')->name('All Posts');