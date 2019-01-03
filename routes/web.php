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
Route::get('/admin/users/create', 'StudentsController@adminCreate')->middleware('is_admin')->name('admin.users.create');
Route::post('/admin/users', 'StudentsController@adminStore')->middleware('is_admin')->name('admin.users.store');
Route::get('/admin/users/{id}', 'StudentsController@adminShow')->middleware('is_admin')->name('admin.users.show');
Route::get('/admin/users/{id}/edit', 'StudentsController@adminEdit')->middleware('is_admin')->name('admin.users.edit');
Route::put('/admin/users/{id}', 'StudentsController@adminUpdate')->middleware('is_admin')->name('admin.users.update');
Route::delete('/admin/users/{id}', 'StudentsController@adminDelete')->middleware('is_admin')->name('admin.users.delete');

// Admin Schools
Route::get('/admin/kindergartens', 'SchoolController@adminIndex')->middleware('is_admin')->name('admin.kindergartens');
Route::get('/admin/kindergartens/create', 'SchoolController@adminCreate')->middleware('is_admin')->name('admin.kindergartens.create');
Route::post('/admin/kindergartens', 'SchoolController@adminStore')->middleware('is_admin')->name('admin.kindergartens.store');
Route::get('/admin/kindergartens/{id}/edit', 'SchoolController@adminEdit')->middleware('is_admin')->name('admin.kindergartens.edit');
Route::put('/admin/kindergartens/{id}', 'SchoolController@adminUpdate')->middleware('is_admin')->name('admin.kindergartens.update');
Route::delete('/admin/kindergartens/{id}', 'SchoolController@adminDelete')->middleware('is_admin')->name('admin.kindergartens.delete');


// Admin Electives
Route::get('/admin/electives', 'ElectivesContoller@adminIndex')->middleware('is_admin')->name('admin.electives');
Route::get('/admin/electives/create', 'ElectivesContoller@adminCreate')->middleware('is_admin')->name('admin.electives.create');
Route::post('/admin/electives', 'ElectivesContoller@adminStore')->middleware('is_admin')->name('admin.electives.store');
Route::get('/admin/electives/{id}', 'ElectivesContoller@adminShow')->middleware('is_admin')->name('admin.electives.show');
Route::get('/admin/electives/{id}/edit', 'ElectivesContoller@adminEdit')->middleware('is_admin')->name('admin.electives.edit');
Route::put('/admin/electives/{id}', 'ElectivesContoller@adminUpdate')->middleware('is_admin')->name('admin.electives.update');
Route::delete('/admin/electives/{id}', 'ElectivesContoller@adminDelete')->middleware('is_admin')->name('admin.electives.delete');

// Admin Groups
Route::get('/admin/groups', 'GroupController@adminIndex')->middleware('is_admin')->name('admin.groups');
Route::get('/admin/groups/create', 'GroupController@adminCreate')->middleware('is_admin')->name('admin.groups.create');
Route::post('/admin/groups', 'GroupController@adminStore')->middleware('is_admin')->name('admin.groups.store');
Route::get('/admin/groups/{id}/edit', 'GroupController@adminEdit')->middleware('is_admin')->name('admin.groups.edit');
Route::put('/admin/groups/{id}', 'GroupController@adminUpdate')->middleware('is_admin')->name('admin.groups.update');
Route::delete('/admin/groups/{id}', 'GroupController@adminDelete')->middleware('is_admin')->name('admin.groups.delete');


// Admin News
Route::get('/admin/posts', 'PostsController@adminIndex')->middleware('is_admin')->name('admin.posts');
Route::get('/admin/posts/create', 'PostsController@adminCreate')->middleware('is_admin')->name('admin.posts.create');
Route::post('/admin/posts', 'PostsController@adminStore')->middleware('is_admin')->name('admin.posts.store');
Route::get('/admin/posts/{id}/edit', 'PostsController@adminEdit')->middleware('is_admin')->name('admin.posts.edit');
Route::put('/admin/posts/{id}', 'PostsController@adminUpdate')->middleware('is_admin')->name('admin.posts.update');
Route::delete('/admin/posts/{id}', 'PostsController@adminDelete')->middleware('is_admin')->name('admin.posts.delete');

// Admin Notifications
Route::get('/admin/notifications', 'NotificationsController@adminIndex')->middleware('is_admin')->name('admin.notifications');
Route::get('/admin/notifications/create', 'NotificationsController@adminCreate')->middleware('is_admin')->name('admin.notifications.create');
Route::post('/admin/notifications', 'NotificationsController@adminStore')->middleware('is_admin')->name('admin.notifications.store');
Route::get('/admin/notifications/{id}/edit', 'NotificationsController@adminEdit')->middleware('is_admin')->name('admin.notifications.edit');
Route::put('/admin/notifications/{id}', 'NotificationsController@adminUpdate')->middleware('is_admin')->name('admin.notifications.update');
Route::delete('/admin/notifications/{id}', 'NotificationsController@adminDelete')->middleware('is_admin')->name('admin.notifications.delete');


// Admin Schedules
Route::get('/admin/schedules', 'SchedulesController@adminIndex')->middleware('is_admin')->name('admin.schedules');
Route::get('/admin/adminGetLessonsByDay', 'SchedulesController@adminGetLessonsByDay')->middleware('is_admin')->name('admin.schedules.adminGetLessonsByDay');
Route::get('/admin/schedules/create', 'SchedulesController@adminCreate')->middleware('is_admin')->name('admin.schedules.create');
Route::post('/admin/schedules', 'SchedulesController@adminStore')->middleware('is_admin')->name('admin.schedules.store');
Route::get('/admin/schedules/{id}', 'SchedulesController@adminShow')->middleware('is_admin')->name('admin.electives.show');
Route::get('/admin/schedules/{id}/edit', 'SchedulesController@adminEdit')->middleware('is_admin')->name('admin.schedules.edit');
Route::put('/admin/schedules/{id}', 'SchedulesController@adminUpdate')->middleware('is_admin')->name('admin.schedules.update');
Route::delete('/admin/schedules/{id}', 'SchedulesController@adminDelete')->middleware('is_admin')->name('admin.schedules.delete');
