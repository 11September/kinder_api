<?php

namespace App\Http\Controllers;

use App\Post;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\File\File;

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

    public function adminIndex()
    {
        $posts = Post::all();

        return view('admin.posts',compact('posts'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        return view('admin.posts.create',compact('schools'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'body' => 'required',
            'until' => 'required',
            'school_id' => 'required',
            'preview' => 'required',
            'image' => 'required',
        ]);

        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;

        $preview = $request->file('preview');
        $input['preview'] = time() . "." . $preview->getClientOriginalExtension();
        $preview->move(public_path('/images/uploads'), $input['preview']);
        $post->preview = '/images/uploads/' . $input['preview'];

        $image = $request->file('image');
        $input['image'] = time() . "." . $image->getClientOriginalExtension();
        $image->move(public_path('/images/uploads'), $input['image']);
        $post->image = '/images/uploads/' . $input['image'];

        $post->save();

        return redirect()->route('admin.posts')->with('message','Новость успешно добавлена!');
    }



    public function adminDelete($id)
    {
        $post = Post::find($id);

        $image = public_path() . $post->image;
        if(file_exists($image)) {
            unlink($image);
        }

        $preview = public_path() . $post->preview;
        if(file_exists($preview)) {
            unlink($preview);
        }

        $post->delete();

        return redirect()->route('admin.posts')->with('message','Новость успешно удалена!');
    }
}
