<?php

namespace App\Providers;

use App\Conversation;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
//use Laravel\Telescope\TelescopeServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('admin.partials.navbar', function($view)
        {
            $user = Auth::user();

            $conversations = Conversation::where([
                ['user1_id', '=', $user->id],
            ])->OrWhere([
                ['user2_id', '=', $user->id],
            ])->with('messages')
                ->with(array
                ('messages' => function ($query) {
                        $query->select('id', 'user_id', 'conversation_id', 'status');
                    }))
                ->get();

            $counter = 0;
            foreach ($conversations as $conversation) {
                foreach ($conversation->messages as $message) {
                    if ($message->user_id !== $user->id && $message->status == "unread") {
                        $counter++;
                    }
                }
            }

            $view->with(['counter' => $counter]);
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
//        if ($this->app->isLocal()) {
//            $this->app->register(TelescopeServiceProvider::class);
//        }
    }
}
