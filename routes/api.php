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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

// Users Auth
Route::middleware('cors')->post('login', 'UsersController@login')->name('Login');
Route::middleware('cors')->post('restore_password', 'UsersController@ResetPassword')->name('Restore Password');
Route::middleware('cors','token')->post('change_password', 'UsersController@ChangePassword')->name('Change Password');
Route::middleware('cors','token')->post('set_avatar', 'UsersController@SetAvatar')->name('Set Avatar');
Route::middleware('cors','token')->post('logout', 'UsersController@logout')->name('Logout');
Route::middleware('cors','token')->get('profile', 'UsersController@profile')->name('Get All User Data');
// Users Auth

Route::middleware('token')->get('schools', 'SchoolController@index')->name('All Schools');
Route::middleware('token')->get('posts', 'PostsController@index')->name('All Posts');
Route::middleware('token')->get('post', 'PostsController@show')->name('One Post');
Route::middleware('token')->get('groups', 'GroupController@index')->name('All Groups');
Route::middleware('token')->get('students', 'StudentsController@index')->name('All Students');
Route::middleware('token')->get('electives', 'ElectivesContoller@index')->name('All Electives');
Route::middleware('token')->get('elective', 'ElectivesContoller@show')->name('One Elective');
