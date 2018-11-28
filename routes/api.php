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

Route::middleware('token')->get('schools', 'SchoolController@index')->name('All Schools');
Route::middleware('token')->get('beers', 'SchoolController@index')->name('All Schools');





// Users Auth and personal info
Route::post('login', 'UsersController@login')->name('register');
Route::post('restore_password', 'UsersController@ResetPassword')->name('ResetPassword');
Route::middleware('token')->post('logout', 'UsersController@logout')->name('logout');

Route::middleware('token')->post('profile/edit', 'UsersController@changePersonalInfo')->name('Change Personal Info');
Route::middleware('token')->get('profile', 'UsersController@profile')->name('profile');
// Users Auth and personal info
