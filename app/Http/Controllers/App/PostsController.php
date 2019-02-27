<?php

namespace App\Http\Controllers\App;

use App\User;
use App\Post;
use OneSignal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Config;


class PostsController
{
    public function index(Request $request, $school_id)
    {
        if (!$school_id || empty($school_id) || !is_numeric($school_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();
            $group = $user->group()->first();

            $posts = Post::select('id', 'title', 'body', 'preview', 'image')
                ->where('until', '>=', date('Y-m-d'))
                ->where('school_id', $school_id)
                ->whereHas('groups', function ($query) use ($group) {
                    $query->where('group_id', '=', $group->id);
                })
                ->latest()
                ->get();

            $posts = $posts->each(function ($item, $key) {
                $data = null;

                if ($item['preview']) {
                    $item['preview'] = Config::get('app.storageurl') . $item['preview'];
                }

                if ($item['image']) {
                    foreach (json_decode($item['image']) as $image) {
                        $data[] = Config::get('app.storageurl') . $image;
                    }
                }

                $item['image'] = $data;
            });

            return response()->json(['data' => $posts], 200);

        } catch (\Exception $exception) {
            Log::warning('PostsController@index Exception: ' . $exception->getMessage() . "Line - " . $exception->getLine());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function show($id)
    {
        if (!$id) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $post = Post::where('id', $id)->select('id', 'title', 'body', 'image', 'preview')->first();

            if (!$post) {
                return response()->json(['message' => 'Новина не знайдена'], 400);
            }


            if (isset($post->preview) || !empty($post->preview)) {
                $post->preview = Config::get('app.storageurl') . $post->preview;
            }

            $data = null;

            if ($post->image) {
                foreach (json_decode($post['image']) as $image) {
                    $data[] = Config::get('app.storageurl') . $image;
                }
            }

            $post->image = $data;

            return [$post];

        } catch (\Exception $exception) {
            Log::warning('PostsController@show Exception: ' . $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
