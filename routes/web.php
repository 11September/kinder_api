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

Route::get('/admin', 'AdminController@admin')->middleware('access_admin')->name('admin');

// Admin Admins
Route::get('/admin/admins', 'AdminController@admins')->middleware('is_admin')->name('admin.admins');
Route::post('/admin/admins/store', 'AdminController@store')->middleware('is_admin')->name('admin');
Route::get('/admin/admins/{id}/edit', 'AdminController@adminEdit')->middleware('is_admin')->name('admin.admins.edit');
Route::put('/admin/admins/{user}', 'AdminController@adminUpdate')->middleware('is_admin')->name('admin.admins.update');
Route::delete('/admin/admins/delete/{user}', 'AdminController@adminDelete')->middleware('is_admin')->name('admin.admins.delete');


// Admin Users
Route::get('/admin/users', 'StudentsController@adminIndex')->middleware('is_admin')->name('admin.users');
Route::get('/admin/users/create', 'StudentsController@adminCreate')->middleware('is_admin')->name('admin.users.create');
Route::post('/admin/users', 'StudentsController@adminStore')->middleware('is_admin')->name('admin.users.store');
Route::get('/admin/users/{id}/edit', 'StudentsController@adminEdit')->middleware('is_admin')->name('admin.users.edit');
Route::put('/admin/users/{user}', 'StudentsController@adminUpdate')->middleware('is_admin')->name('admin.users.update');
Route::delete('/admin/users/{id}', 'StudentsController@adminDelete')->middleware('is_admin')->name('admin.users.delete');

// Admin Schools
Route::get('/admin/kindergartens', 'SchoolController@adminIndex')->middleware('is_admin')->name('admin.kindergartens');
Route::get('/admin/kindergartens/create', 'SchoolController@adminCreate')->middleware('is_admin')->name('admin.kindergartens.create');
Route::post('/admin/kindergartens', 'SchoolController@adminStore')->middleware('is_admin')->name('admin.kindergartens.store');
Route::get('/admin/kindergartens/{id}/edit', 'SchoolController@adminEdit')->middleware('is_admin')->name('admin.kindergartens.edit');
Route::put('/admin/kindergartens/{id}', 'SchoolController@adminUpdate')->middleware('is_admin')->name('admin.kindergartens.update');
Route::delete('/admin/kindergartens/{id}', 'SchoolController@adminDelete')->middleware('is_admin')->name('admin.kindergartens.delete');

// Admin Groups
Route::get('/admin/groups', 'GroupController@adminIndex')->middleware('is_admin')->name('admin.groups');
Route::get('/admin/groups/create', 'GroupController@adminCreate')->middleware('is_admin')->name('admin.groups.create');
Route::post('/admin/groups', 'GroupController@adminStore')->middleware('is_admin')->name('admin.groups.store');
Route::get('/admin/groups/{id}/edit', 'GroupController@adminEdit')->middleware('is_admin')->name('admin.groups.edit');
Route::put('/admin/groups/{id}', 'GroupController@adminUpdate')->middleware('is_admin')->name('admin.groups.update');
Route::delete('/admin/groups/{id}', 'GroupController@adminDelete')->middleware('is_admin')->name('admin.groups.delete');
Route::post('/admin/groups/getAllGroupsById', 'GroupController@getAllGroupsById')->middleware('access_admin')->name('admin.users.getAllGroupsById');

// Admin News
Route::get('/admin/posts', 'PostsController@adminIndex')->middleware('is_admin')->name('admin.posts');
Route::get('/admin/posts/create', 'PostsController@adminCreate')->middleware('is_admin')->name('admin.posts.create');
Route::post('/admin/posts', 'PostsController@adminStore')->middleware('is_admin')->name('admin.posts.store');
Route::get('/admin/posts/{id}/edit', 'PostsController@adminEdit')->middleware('is_admin')->name('admin.posts.edit');
Route::put('/admin/posts/{id}', 'PostsController@adminUpdate')->middleware('is_admin')->name('admin.posts.update');
Route::delete('/admin/posts/{id}', 'PostsController@adminDelete')->middleware('is_admin')->name('admin.posts.delete');

// Admin Schedules
Route::get('/admin/schedules', 'SchedulesController@adminIndex')->middleware('is_admin')->name('admin.schedules');
Route::get('/admin/schedules/{id}', 'SchedulesController@adminShow')->middleware('is_admin')->name('admin.electives.show');
Route::get('/admin/adminGetLessonsByDay', 'SchedulesController@adminGetLessonsByDay')->middleware('is_admin')->name('admin.schedules.adminGetLessonsByDay');
Route::post('/admin/adminSaveLessonsByDay', 'SchedulesController@adminSaveLessonsByDay')->middleware('is_admin')->name('admin.schedules.adminSaveLessonsByDay');
Route::get('/admin/adminGetLessonsAll', 'SchedulesController@adminGetLessonsAll')->middleware('is_admin')->name('admin.schedules.adminGetLessonsAll');
Route::get('/admin/adminDeleteLessonsByDay', 'SchedulesController@adminDeleteLessonsByDay')->middleware('is_admin')->name('admin.schedules.adminDeleteLessonsByDay');

// Admin nutrition
Route::get('/admin/nutritions', 'NutritionsController@adminIndex')->middleware('is_admin')->name('admin.nutritions');
Route::get('/admin/nutritions/{id}', 'NutritionsController@adminShow')->middleware('is_admin')->name('admin.nutritions.show');
Route::get('/admin/adminGetFoodsByDay', 'NutritionsController@adminGetFoodsByDay')->middleware('is_admin')->name('admin.nutritions.adminGetFoodsByDay');
Route::post('/admin/adminSaveFoodByDay', 'NutritionsController@adminSaveFoodByDay')->middleware('is_admin')->name('admin.nutritions.adminSaveFoodByDay');
Route::get('/admin/adminGetFoodsAll', 'NutritionsController@adminGetFoodsAll')->middleware('is_admin')->name('admin.nutritions.adminGetFoodsAll');
Route::get('/admin/adminDeleteFoodByDay', 'NutritionsController@adminDeleteFoodByDay')->middleware('is_admin')->name('admin.nutritions.adminDeleteFoodByDay');

// Admin Notifications
Route::get('/admin/notifications', 'NotificationsController@adminIndex')->middleware('is_admin')->name('admin.notifications');
Route::post('/admin/notifications', 'NotificationsController@adminStore')->middleware('is_admin')->name('admin.notifications.store');
Route::post('/admin/notifications/notifyScheduleByGroup', 'NotificationsController@notifyScheduleByGroup')->middleware('is_admin')->name('admin.notifications.notifyScheduleByGroup');
Route::post('/admin/notifications/notifyFoodsBySchool', 'NotificationsController@notifyFoodsBySchool')->middleware('is_admin')->name('admin.notifications.notifyFoodsBySchool');

// Admin Conversations
Route::get('/admin/conversations', 'ConversationController@admin')->middleware('access_admin', 'emptyGroupId')->name('admin.messages');
Route::get('/admin/conversations/group/{id}', 'ConversationController@adminShowGroupUsers')->middleware('access_admin', 'emptyGroupId')->name('admin.groupUsers');
Route::get('/admin/conversations/{id}', 'ConversationController@checkConversation')->middleware('access_admin', 'emptyGroupId')->name('admin.conversation.checkConversation');
Route::get('/admin/conversations/user/{id}', 'ConversationController@user')->middleware('access_admin', 'emptyGroupId')->name('admin.conversation.user');

Route::post('/admin/messages', 'MessagesController@adminStore')->middleware('access_admin', 'emptyGroupId')->name('admin.messages.store');
Route::get('/admin/messages/setReadMessages/{user_id}', 'MessagesController@setReadMessages', 'emptyGroupId')->middleware('access_admin')->name('admin.messages.setReadMessages');
//Route::post('/admin/messages/fetchMessages', 'MessagesController@fetchMessages')->middleware('access_admin', 'emptyGroupId')->name('admin.messages.fetchMessages');
Route::get('/admin/messages/unread_messages_counter', 'MessagesController@AdminMessagesCounter')->middleware('access_admin')->name('admin.messages.counter');
