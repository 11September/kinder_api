<?php

namespace App\Http\Controllers;

use App\User;
use App\Post;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StorePost;
use App\Http\Requests\UpdatePost;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\File\File;

class PostsController extends Controller
{
    public $sourse =  "http://8.dev-kit.ru";

    public function index(Request $request, $school_id)
    {
        if (!$school_id || empty($school_id) || !is_numeric($school_id)) {
            return response()->json(['message' => 'Дані в запиті не заповнені або не вірні!'], 400);
        }

        try {
            $user = User::where('token', '=', $request->header('x-auth-token'))->first();

//            $group = $user->group()->first();
            if (!$user->group()->first()){
                $group = Group::where('moderator_id', $user->id)->OrWhere('user_id', $user->id)->first();
            }else{
                $group = $user->group()->first();
            }

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
                    $item['preview'] = Config::get('app.url') . $item['preview'];
                }

                if ($item['image']) {
                    foreach(json_decode($item['image']) as $image){
                        $data[] = Config::get('app.url') . $image;
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

            if (!$post){
                return response()->json(['message' => 'Новина не знайдена'], 400);
            }

            if ($post['image']) {
                foreach(json_decode($post['image']) as $image){
                    $data[] = Config::get('app.url') . $image;
                }
            }

            $post['image'] = $data;

            if (isset($post->preview) || !empty($post->preview)){
                $post->preview = Config::get('app.url') . $post->preview;
            }

            return [$post];

        } catch (\Exception $exception) {
            Log::warning('PostsController@show Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
    }

    public function getAllGroupsById(Request $request)
    {
        $request->validate([
            'id' => 'required',
        ]);

        $groups = Group::whereHas('schools', function ($query) use ($request) {
            $query->where('school_id', '=', $request->id);
        })->get();

        return response()->json(['data'=> $groups, 'success'=>true]);
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

        $groups = Group::whereHas('schools', function ($query) use ($schools) {
            $query->where('school_id', '=', $schools->first()->id);
        })->get();

        return view('admin.posts.create',compact('schools', 'groups'));
    }

    public function adminStore(StorePost $request)
    {
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;

        if($request->hasfile('image'))
        {
            foreach($request->file('image') as $image)
            {
                $name = '/images/uploads/posts/' . time() . "-" . uniqid() . "." . $image->getClientOriginalName();
                $image->move(public_path('/images/uploads/posts'), $name);
                $data[] = $name;
            }
        }

        $preview = $request->file('preview');
        $input['preview'] = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
        $preview->move(public_path('/images/uploads/posts'), $input['preview']);

        $post->preview = '/images/uploads/posts/' . $input['preview'];
        $post->image = json_encode($data);

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

    public function adminUpdate(UpdatePost $request, $id)
    {
        $post = Post::where('id', $id)->first();

        if (isset($request->old_image) && !empty($request->old_image)){
            $post->image = $request->old_image;
        }else{
            $this->deletePreviousEncodeImages($post->image);
            $images = $this->storeNewEncodeImages($request->image);
            $post->image = json_encode($images);
        }

        if (isset($request->old_preview) && !empty($request->old_preview) && file_exists(public_path() . $request->old_preview)){
            $post->preview = $request->old_preview;
        }else{
            $this->deletePreviousPreviewImage($post->preview);
            $newPreview = $this->storeNewPreviewImage($request->preview);
            $post->preview = $newPreview;
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

        $this->deletePreviousEncodeImages($post->image);
        $this->deletePreviousPreviewImage($post->preview);
        $post->groups()->detach();
        $post->delete();

        return redirect()->route('admin.posts')->with('message','Новина успішно видалена!');
    }

    public function deletePreviousEncodeImages($data)
    {
        foreach(json_decode($data) as $image){
            $old_image = public_path() . $image;
            if(file_exists($old_image)) {
                unlink($old_image);
            }
        }

        return true;
    }

    public function storeNewEncodeImages($data)
    {
        foreach($data as $image)
        {
            $name = '/images/uploads/posts/' . time() . "-" . uniqid() . "." . $image->getClientOriginalName();
            $image->move(public_path('/images/uploads/posts'), $name);
            $newImages[] = $name;
        }

        return $newImages;
    }

    public function deletePreviousPreviewImage($data)
    {
        $preview = public_path() . $data;
        if(file_exists($preview)) {
            unlink($preview);
        }

        return true;
    }

    public function storeNewPreviewImage($preview)
    {
        $image = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
        $preview->move(public_path('/images/uploads/posts'), $image);

        return '/images/uploads/posts/' . $image;
    }
}
