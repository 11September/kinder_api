<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class PostsController extends Controller
{
    public function index(Request $request)
    {
        try {
            $posts = Post::select('id', 'title', 'body', 'image', 'created_at')
                ->filter($request->all())->published()->get();

            $posts = $posts->each(function ($item, $key) {
                if ($item['image']) {
                    $source = "http://url/storage/";
                    $item['image'] = $source . $item['image'];
                }
            });

            return ['data' => $posts];

        } catch (\Exception $exception) {
            Log::warning('PostsController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $post = Post::where('id' ,$request->id)->select('id', 'title', 'body', 'image', 'created_at')->first();

            if (isset($post->image) || !empty($post->image)){
                $post->image = "http://url/storage/" . $post->image;
            }

            return ['data' => $post];

        } catch (\Exception $exception) {
            Log::warning('PostsController@show Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }
}
