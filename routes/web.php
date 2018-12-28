<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//Route::group(['prefix' => 'admin'], function () {
//    Voyager::routes();
//});

Route::get('/admin', 'AdminController@admin')->middleware('is_admin')->name('admin');

// Admin Admins
Route::get('/admin/admins', 'AdminController@admins')->middleware('is_admin')->name('admin');
Route::post('/admin/admins/store', 'AdminController@store')->middleware('is_admin')->name('admin');
Route::get('/admin/admins/delete/{user}', 'AdminController@delete')->middleware('is_admin')->name('admin');


// Admin Users
Route::get('/admin/users', 'StudentsController@adminIndex')->middleware('is_admin')->name('admin.users');
Route::get('/admin/users/create', 'StudentsController@adminCreate')->middleware('is_admin')->name('List Electives Admin Panel');
Route::post('/admin/users', 'StudentsController@adminStore')->middleware('is_admin')->name('List Electives Admin Panel');
Route::get('/admin/users/{id}', 'StudentsController@adminShow')->middleware('is_admin')->name('admin');
Route::get('/admin/users/{id}/edit', 'StudentsController@adminEdit')->middleware('is_admin')->name('admin');
Route::put('/admin/users/{id}', 'StudentsController@adminUpdate')->middleware('is_admin')->name('admin');
Route::delete('/admin/users/{id}', 'StudentsController@adminDelete')->middleware('is_admin')->name('admin');

// Admin Schools
Route::get('/admin/kindergartens', 'SchoolController@adminIndex')->middleware('is_admin')->name('admin.kindergartens');
Route::post('/admin/kindergartens', 'SchoolController@adminStore')->middleware('is_admin')->name('admin');


// Admin Electives
Route::get('/admin/electives', 'ElectivesContoller@adminIndex')->middleware('is_admin')->name('List Electives Admin Panel');
Route::get('/admin/electives/create', 'ElectivesContoller@adminCreate')->middleware('is_admin')->name('List Electives Admin Panel');
Route::post('/admin/electives', 'ElectivesContoller@adminStore')->middleware('is_admin')->name('List Electives Admin Panel');
Route::get('/admin/electives/{id}', 'ElectivesContoller@adminShow')->middleware('is_admin')->name('admin');
Route::get('/admin/electives/{id}/edit', 'ElectivesContoller@adminEdit')->middleware('is_admin')->name('admin');
Route::put('/admin/electives/{id}', 'ElectivesContoller@adminUpdate')->middleware('is_admin')->name('admin');
Route::delete('/admin/electives/{id}', 'ElectivesContoller@adminDelete')->middleware('is_admin')->name('admin');

// Admin Groups
Route::get('/admin/groups', 'GroupController@adminIndex')->middleware('is_admin')->name('admin.groups');
Route::get('/admin/groups/create', 'GroupController@adminCreate')->middleware('is_admin')->name('Posts Create Admin Panel');
Route::post('/admin/groups', 'GroupController@adminStore')->middleware('is_admin')->name('Posts Store Admin Panel');
Route::get('/admin/groups/{id}/edit', 'GroupController@adminEdit')->middleware('is_admin')->name('admin');
Route::put('/admin/groups/{id}', 'GroupController@adminUpdate')->middleware('is_admin')->name('admin');
Route::delete('/admin/groups/{id}', 'GroupController@adminDelete')->middleware('is_admin')->name('admin');


// Admin News
Route::get('/admin/posts', 'PostsController@adminIndex')->middleware('is_admin')->name('admin.posts');
Route::get('/admin/posts/create', 'PostsController@adminCreate')->middleware('is_admin')->name('Posts Create Admin Panel');
Route::post('/admin/posts', 'PostsController@adminStore')->middleware('is_admin')->name('Posts Store Admin Panel');
Route::get('/admin/posts/{id}/edit', 'PostsController@adminEdit')->middleware('is_admin')->name('admin');
Route::put('/admin/posts/{id}', 'PostsController@adminUpdate')->middleware('is_admin')->name('admin');
Route::delete('/admin/posts/{id}', 'PostsController@adminDelete')->middleware('is_admin')->name('admin');
