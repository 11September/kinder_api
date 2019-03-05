<?php

namespace App\Http\Controllers;

use App\User;
use App\Post;
use OneSignal;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StorePost;
use App\Http\Requests\UpdatePost;

class PostsController extends Controller
{
    public function adminIndex()
    {
        $posts = Post::with(array('school' => function ($query) {
            $query->select('id', 'name');
        }))->latest()->get();

        return view('admin.posts', compact('posts'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        if ($schools->first()) {
            $groups = Group::where('school_id', $schools->first()->id)->get();
        } else {
            $groups = [];
        }

        return view('admin.posts.create', compact('schools', 'groups'));
    }

    public function adminStore(StorePost $request)
    {
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;

        if (isset($request->image) && $request->hasfile('image')) {
            foreach ($request->file('image') as $image) {
                $name = '/images/uploads/posts/' . time() . "-" . uniqid() . "." . $image->getClientOriginalName();
                $image->move(storage_path('app/public/images/uploads/posts'), $name);
                $data[] = $name;
            }
        }

        $preview = $request->file('preview');
        $input['preview'] = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
        $preview->move(storage_path('app/public/images/uploads/posts'), $input['preview']);

        $post->preview = '/images/uploads/posts/' . $input['preview'];
        $post->image = (isset($data)) ? json_encode($data) : null;

        $post->save();

        $post->groups()->sync($request->group_id, false);

        $data = $request->all();
        $this->notifyNewPost($data, $post->id);

        return redirect()->route('posts')->with('message', 'Новина успішно додана! Повідомлення користувачам про створення новини відправлено!');
    }

    public function adminEdit($id)
    {
        $post = Post::where('id', $id)->with('groups')->first();

        $schools = School::all();

        $groups = Group::all();

        return view('admin.posts.edit', compact('schools', 'post', 'groups'));
    }

    public function adminUpdate(UpdatePost $request, $id)
    {
//        dd($request->all());

        $post = Post::where('id', $id)->first();

        if (isset($request->old_preview) && !empty($request->old_preview) && file_exists(storage_path("app/public") . $request->old_preview)) {
            $post->preview = $request->old_preview;
        } else {
            $this->deletePreviousPreviewImage($post->preview);
            $newPreview = $this->storeNewPreviewImage($request->preview);
            $post->preview = $newPreview;
        }

        if (isset($request->old_image) && !empty($request->old_image) && !isset($request->image)) {
            $post->image = $request->old_image;
        } elseif (isset($request->old_image) && !empty($request->old_image) && $request->image) {
            $images = $this->storeNewEncodeImages($request->image);
            $newImages = array_merge($images, json_decode($post->image));
            $post->image = json_encode($newImages);
        } elseif ($request->old_image == null && $request->image) {
            $images = $this->storeNewEncodeImages($request->image);
            $post->image = json_encode($images);
        } else {
            $post->image = null;
        }

        $post->title = $request->title;
        $post->body = $request->body;
        $post->until = $request->until;
        $post->school_id = $request->school_id;
        $post->save();

        $post->groups()->sync($request->group_id, true);

        return redirect()->route('posts')->with('message', 'Новина успішно оновлена!');
    }

    public function adminDelete($id)
    {
        $post = Post::find($id);

        if ($post->image && !is_null($post->image)) {
            $this->deletePreviousEncodeImages($post->image);
        }

        $this->deletePreviousPreviewImage($post->preview);
        $post->groups()->detach();
        $post->delete();

        return redirect()->route('posts')->with('message', 'Новина успішно видалена!');
    }

    public function deleteOneEncodeImage(Request $request)
    {
        $request->validate([
            'id' => 'required',
            'path' => 'required|string|max:255',
        ]);

        $post = Post::where('id', $request->id)->first();

        $newImages = array();
        foreach (json_decode($post->image) as $image) {
            if ($image == $request->path) {
                $old_image = storage_path('app/public') . $image;

                if (file_exists($old_image)) {
                    unlink($old_image);
                }
            } else {
                $newImages[] = $image;
            }
        }

        if (count($newImages) == 0) {
            $post->image = null;
            $count = 0;
        } else {
            $post->image = json_encode($newImages);
            $count = count($newImages);
        }

        $post->save();

        return response()->json(['success' => true, 'count' => $count, 'images' => $post->image]);
    }

    public function deletePreviousEncodeImages($data)
    {
        foreach (json_decode($data) as $image) {
            $old_image = storage_path('app/public') . $image;
            if (file_exists($old_image)) {
                unlink($old_image);
            }
        }

        return true;
    }

    public function storeNewEncodeImages($data)
    {
        foreach ($data as $image) {
            $name = '/images/uploads/posts/' . time() . "-" . uniqid() . "." . $image->getClientOriginalName();
            $image->move(storage_path('app/public/images/uploads/posts'), $name);
            $newImages[] = $name;
        }

        return $newImages;
    }

    public function deletePreviousPreviewImage($data)
    {
        $preview = storage_path('app/public') . $data;
        if (file_exists($preview)) {
            unlink($preview);
        }

        return true;
    }

    public function storeNewPreviewImage($preview)
    {
        $image = time() . "-" . uniqid() . "." . $preview->getClientOriginalExtension();
        $preview->move(storage_path('app/public/images/uploads/posts'), $image);

        return '/images/uploads/posts/' . $image;
    }

    public function notifyNewPost($request, $id)
    {
        if (isset($request['all']) && $request['all'] == "all") {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->get();

        } else {
            $users = User::select('id', 'player_id')
                ->where('player_id', '!=', null)
                ->where('push', 'enabled')
                ->active()
                ->where('school_id', $request['school_id'])
                ->whereIn('group_id', $request['group_id'])
                ->get();
        }

        $player_ids = array();
        foreach ($users as $user) {
            $player_ids[] = $user->player_id;
        }

        if ($player_ids && !empty($player_ids)) {
            $params = [];
            $params['headings'] = [
                "en" => $request['title']
            ];
            $params['contents'] = [
                "en" => str_limit($request['body'], 20)
            ];
            $params['include_player_ids'] = $player_ids;
            $params['data'] = ["post_id" => $id, "type" => "post"];
            \OneSignal::sendNotificationCustom($params);
        }
    }
}
