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

Route::get('/', 'WelcomeController@welcome')->name('welcome');

Auth::routes();

Route::get('/set_push_enable', 'UsersController@SetPushEnable')->name('Set Push');
Route::get('/admin', 'AdminController@admin')->middleware('access_admin')->name('admin');

Route::group(['prefix' => 'admin'], function () {
    Route::middleware(['is_admin', 'auth'])->group(function () {

        Route::group(['prefix' => 'admins'], function () {
            Route::get('/', 'AdminController@admins')->name('admins');
            Route::post('/store', 'AdminController@store')->name('store');
            Route::get('/{id}/edit', 'AdminController@adminEdit')->name('admins.edit');
            Route::put('/{user}', 'AdminController@adminUpdate')->name('update');
            Route::delete('/{user}', 'AdminController@adminDelete')->name('delete');
        });

        Route::group(['prefix' => 'users'], function () {
            Route::get('/', 'StudentsController@adminIndex')->name('users');
            Route::get('/create', 'StudentsController@adminCreate')->name('create');
            Route::post('/', 'StudentsController@adminStore')->name('store');
            Route::get('/{id}/edit', 'StudentsController@adminEdit')->name('edit');
            Route::put('/{user}', 'StudentsController@adminUpdate')->name('update');
            Route::delete('/{id}', 'StudentsController@adminDelete')->name('delete');
        });

        Route::group(['prefix' => 'kindergartens'], function () {
            Route::get('/', 'SchoolController@adminIndex')->name('kindergartens');
            Route::post('/', 'SchoolController@adminStore')->name('store');
            Route::get('/{id}/edit', 'SchoolController@adminEdit')->name('edit');
            Route::put('/{id}', 'SchoolController@adminUpdate')->name('update');
            Route::delete('/{id}', 'SchoolController@adminDelete')->name('delete');
        });

        Route::group(['prefix' => 'groups'], function () {
            Route::get('/', 'GroupController@adminIndex')->name('groups');
            Route::get('/create', 'GroupController@adminCreate')->name('create');
            Route::post('/', 'GroupController@adminStore')->name('store');
            Route::get('/{id}/edit', 'GroupController@adminEdit')->name('edit');
            Route::put('/{id}', 'GroupController@adminUpdate')->name('update');
            Route::delete('/{id}', 'GroupController@adminDelete')->name('delete');
        });

        Route::group(['prefix' => 'posts'], function () {
            Route::get('/', 'PostsController@adminIndex')->name('posts');
            Route::get('/create', 'PostsController@adminCreate')->name('create');
            Route::post('/', 'PostsController@adminStore')->name('store');
            Route::get('/{id}/edit', 'PostsController@adminEdit')->name('edit');
            Route::put('/{id}', 'PostsController@adminUpdate')->name('update');
            Route::delete('/{id}', 'PostsController@adminDelete')->name('delete');
            Route::post('/deleteOneImage', 'PostsController@deleteOneEncodeImage')->name('deleteOneImage');
        });

        Route::group(['prefix' => 'schedules'], function () {
            Route::get('/', 'SchedulesController@adminIndex')->name('schedules');
            Route::get('/{id}', 'SchedulesController@adminShow')->name('show');
            Route::post('/adminGetLessonsAll', 'SchedulesController@adminGetLessonsAll')->name('adminGetLessonsAll');
            Route::post('/adminGetLessonsByDay', 'SchedulesController@adminGetLessonsByDay')->name('adminGetLessonsByDay');
            Route::post('/adminSaveLessonsByDay', 'SchedulesController@adminSaveLessonsByDay')->name('adminSaveLessonsByDay');
            Route::post('/adminDeleteLessonsByDay', 'SchedulesController@adminDeleteLessonsByDay')->name('adminDeleteLessonsByDay');
        });

        Route::group(['prefix' => 'nutritions'], function () {
            Route::get('/', 'NutritionsController@adminIndex')->name('nutritions');
            Route::get('/{id}', 'NutritionsController@adminShow')->name('show');
            Route::post('/adminGetFoodsAll', 'NutritionsController@adminGetFoodsAll')->name('adminGetFoodsAll');
            Route::post('/adminGetFoodsByDay', 'NutritionsController@adminGetFoodsByDay')->name('adminGetFoodsByDay');
            Route::post('/adminSaveFoodByDay', 'NutritionsController@adminSaveFoodByDay')->name('adminSaveFoodByDay');
            Route::post('/adminDeleteFoodByDay', 'NutritionsController@adminDeleteFoodByDay')->name('adminDeleteFoodByDay');
        });

        Route::group(['prefix' => 'notifications'], function () {
            Route::get('/', 'NotificationsController@adminIndex')->name('notifications');
            Route::post('/', 'NotificationsController@adminStore')->name('store');
            Route::post('/notifyScheduleByGroup', 'NotificationsController@notifyScheduleByGroup')->name('notifyScheduleByGroup');
            Route::post('/notifyFoodsBySchool', 'NotificationsController@notifyFoodsBySchool')->name('notifyFoodsBySchool');
        });
    });

    Route::middleware(['auth', 'access_admin', 'emptyGroupId'])->group(function () {
        Route::group(['prefix' => 'conversations'], function () {
            Route::get('/', 'ConversationController@admin')->name('conversations');
            Route::get('/group/{id}', 'ConversationController@adminShowGroupUsers')->name('adminShowGroupUsers');
            Route::get('/{id}', 'ConversationController@checkConversation')->name('checkConversation');
            Route::get('/user/{id}', 'ConversationController@user')->name('chat.user');
        });

        Route::group(['prefix' => 'messages'], function () {
            Route::post('/store', 'MessagesController@adminStore')->name('messages.store');
            Route::get('/setReadMessages/{user_id}', 'MessagesController@setReadMessages')->name('setReadMessages');
        });
    });

    Route::middleware(['auth', 'access_admin'])->group(function () {
        Route::post('/groups/getAllGroupsById', 'GroupController@getAllGroupsById')->name('admin.users.getAllGroupsById');
        Route::get('/messages/unread_messages_counter', 'MessagesController@AdminMessagesCounter')->name('messages.main.counter');
    });
});








