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

// Users Auth
Route::middleware('cors')->post('login', 'UsersController@login')->name('Login');
Route::middleware('cors')->post('restore_password', 'UsersController@ResetPassword')->name('Restore Password');
Route::middleware('cors','token')->post('change_password', 'UsersController@ChangePassword')->name('Change Password');
Route::middleware('cors','token')->post('set_avatar', 'UsersController@SetAvatar')->name('Set Avatar');
Route::middleware('cors','token')->post('set_player', 'UsersController@SetPlayer')->name('Set User Player ID');
Route::middleware('cors','token')->post('set_push', 'UsersController@SetPush')->name('Set Push');
Route::middleware('cors','token')->post('logout', 'UsersController@logout')->name('Logout');
Route::middleware('cors','token')->get('profile', 'UsersController@profile')->name('Get All User Data');
// Users Auth

Route::middleware('cors','token')->get('posts/{school_id}', 'PostsController@index')->name('Get Posts');
Route::middleware('cors','token')->get('post/{id}', 'PostsController@show')->name('Get Post');

Route::middleware('cors','token')->get('schedules/{school_id}', 'SchedulesController@index')->name('Get Schedules');
Route::middleware('cors','token')->get('nutritions/{school_id}', 'NutritionsController@index')->name('Get Nutritions');

Route::middleware('cors','token')->get('group_users', 'GroupController@GroupUsers')->name('Get Users Group');
Route::middleware('cors','token')->post('conversation', 'ConversationController@createOrGetConversation')->name('Get User Conversation Or Create Conversation');
Route::middleware('cors','token')->post('store_message', 'MessagesController@storeMessage')->name('Store Message');
Route::middleware('cors','token')->post('messages_mark_read', 'MessagesController@messagesMarkRead')->name('Store Message');
Route::middleware('cors','token')->get('unread_messages_counter', 'MessagesController@unreadMessagesCounter')->name('Unread Messages Counter');

//Route::middleware('cors','token')->post('message','MessagesController@ApiStore')->name('message.store');
