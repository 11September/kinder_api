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


Route::get('/admin/admins', 'AdminController@admins')->middleware('is_admin')->name('admin');
Route::post('/admin/admins/store', 'AdminController@store')->middleware('is_admin')->name('admin');
Route::get('/admin/admins/delete/{user}', 'AdminController@delete')->middleware('is_admin')->name('admin');

Route::get('/admin/users', 'AdminController@users')->middleware('is_admin')->name('admin');

Route::get('/admin/kindergartens', 'AdminController@kindergartens')->middleware('is_admin')->name('admin');
Route::post('/admin/kindergartens', 'AdminController@kindergartens')->middleware('is_admin')->name('admin');

// Admin Electives
Route::get('/admin/electives', 'ElectivesContoller@admin')->middleware('is_admin')->name('List Electives Admin Panel');
Route::get('/admin/electives/create', 'ElectivesContoller@adminCreate')->middleware('is_admin')->name('List Electives Admin Panel');
Route::post('/admin/electives', 'ElectivesContoller@adminStore')->middleware('is_admin')->name('List Electives Admin Panel');
Route::get('/admin/electives/{id}', 'ElectivesContoller@adminShow')->middleware('is_admin')->name('admin');
Route::get('/admin/electives/{id}/edit', 'ElectivesContoller@adminEdit')->middleware('is_admin')->name('admin');
Route::put('/admin/electives/{id}', 'ElectivesContoller@adminUpdate')->middleware('is_admin')->name('admin');
Route::delete('/admin/electives/{id}', 'ElectivesContoller@adminDelete')->middleware('is_admin')->name('admin');
