<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

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
}
