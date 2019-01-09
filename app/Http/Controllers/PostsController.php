<?php

namespace App\Http\Controllers;

use App\Group;
use App\Http\Requests\StorePost;
use App\Post;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\File\File;

class PostsController extends Controller
{
    public $sourse = "http://8.dev-kit.ru/";

    public function index(Request $request)
    {
        try {
            $posts = Post::select('id', 'title', 'body', 'image', 'preview', 'created_at')
                ->filter($request->all())->get();

            $posts = $posts->each(function ($item, $key) {
                if ($item['image']) {
                    $item['image'] = $this->sourse . $item['image'];
                }

                if ($item['preview']) {
                    $item['preview'] = $this->sourse . $item['preview'];
                }
            });

            dd($posts);

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
        $posts = Post::with(array('school'=>function($query){
            $query->select('id','name');
        }))->latest()->get();

        return view('admin.posts',compact('posts'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        $groups = Group::all();

        return view('admin.posts.create',compact('schools', 'groups'));
    }

    public function adminStore(StorePost $request)
    {
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;

        $preview = $request->file('preview');
        $input['preview'] = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
        $preview->move(public_path('/images/uploads'), $input['preview']);
        $post->preview = '/images/uploads/' . $input['preview'];

        $image = $request->file('image');
        $input['image'] = time() . "-" . uniqid() . "." . $image->getClientOriginalExtension();
        $image->move(public_path('/images/uploads'), $input['image']);
        $post->image = '/images/uploads/' . $input['image'];

        $post->save();

        $post->groups()->sync($request->group_id, false);

        return redirect()->route('admin.posts')->with('message','Новина успішно додана!');
    }

    public function adminEdit($id)
    {
        $post = Post::where('id', $id)->with('groups')->first();

        $schools = School::all();

        $groups = Group::all();

        return view('admin.posts.edit',compact('schools','post', 'groups'));
    }

    public function adminUpdate(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'body' => 'required',
            'until' => 'required',
            'school_id' => 'required',
            'group_id' => 'required',
        ]);

        $post = Post::where('id', $id)->first();

        if (isset($request->old_image) && !empty($request->old_image) && file_exists(public_path() . $request->old_image)){
            $post->image = $request->old_image;
        }else{
            $image = public_path() . $post->image;
            if(file_exists($image)) {
                unlink($image);
            }

            $image = $request->file('image');
            $input['image'] = time() . "-" . uniqid() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('/images/uploads'), $input['image']);
            $post->image = '/images/uploads/' . $input['image'];
        }

        if (isset($request->old_preview) && !empty($request->old_preview) && file_exists(public_path() . $request->old_preview)){
            $post->preview = $request->old_preview;
        }else{
            $preview = public_path() . $post->preview;
            if(file_exists($preview)) {
                unlink($preview);
            }

            $preview = $request->file('preview');
            $input['preview'] = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
            $preview->move(public_path('/images/uploads'), $input['preview']);
            $post->preview = '/images/uploads/' . $input['preview'];
        }

        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;
        $post->save();

        $post->groups()->sync($request->group_id, true);

        return redirect()->route('admin.posts')->with('message','Новина успішно оновлена!');
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

        $post->groups()->detach();

        $post->delete();

        return redirect()->route('admin.posts')->with('message','Новина успішно видалена!');
    }
}
