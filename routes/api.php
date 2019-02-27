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

Route::namespace('App')->group(function () {
    Route::middleware(['cors'])->group(function () {
        Route::name('user.')->group(function () {
            Route::post('login', 'UsersController@login')->name('login');
            Route::post('restore_password', 'UsersController@ResetPassword')->name('reset_password');
        });
    });

    Route::middleware(['cors', 'token'])->group(function () {
        Route::name('users.')->group(function () {
            Route::post('change_password', 'UsersController@ChangePassword')->name('change_pass');
            Route::post('set_avatar', 'UsersController@SetAvatar')->name('set_avatar');
            Route::post('set_player', 'UsersController@SetPlayer')->name('set_user_player_id');
            Route::post('set_push', 'UsersController@SetPush')->name('set_push');
            Route::post('set_push_chat', 'UsersController@SetPushChat')->name('set_push_chat');
            Route::post('logout', 'UsersController@logout')->name('logout');
        });

        Route::name('posts.')->group(function () {
            Route::get('posts/{school_id}', 'PostsController@index')->name('get_posts');
            Route::get('post/{id}', 'PostsController@show')->name('get_post');
        });

        Route::name('schedules.')->group(function () {
            Route::get('schedules/{school_id}', 'SchedulesController@index')->name('get_schedules');
            Route::get('nutritions/{school_id}', 'NutritionsController@index')->name('get_nutritions');
        });

        Route::name('groups.')->group(function () {
            Route::get('group_users', 'GroupController@GroupUsers')->name('get_users_group');
            Route::get('group_users_counters', 'GroupController@GroupUsersCounters')->name('get_users_group');
        });

        Route::name('conversations.')->group(function () {
            Route::post('conversation', 'ConversationController@createOrGetConversation')->name('get_or_create_conversation');
        });

        Route::name('messages.')->group(function () {
            Route::post('store_message', 'MessagesController@storeMessage')->name('store');
            Route::post('messages_mark_read', 'MessagesController@messagesMarkRead')->name('mark_read');
//            Route::get('unread_messages_counter', 'MessagesController@unreadMessagesCounter')->name('unread_messages_counter');
        });
    });
});
