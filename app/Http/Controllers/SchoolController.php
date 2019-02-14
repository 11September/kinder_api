<?php

namespace App\Http\Controllers;

use App\User;
use App\Post;
use App\Group;
use App\School;
use App\Conversation;
use Illuminate\Http\Request;
use App\Http\Requests\StoreSchool;
use App\Http\Requests\UpdateSchool;
use Illuminate\Support\Facades\Log;

class SchoolController extends Controller
{
    public function adminIndex()
    {
        $schools = School::with('groups')->withCount(['groups'])->get();

        $groups = Group::with('school')->get();

        return view('admin.kindergartens', compact('schools', 'groups'));
    }

    public function adminStore(StoreSchool $request)
    {
        $school = new School();
        $school->name = $request->name;
        $school->save();

        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно доданий!');
    }

    public function adminEdit($id)
    {
        $school = School::where('id', $id)->with('groups')->first();

        $schools = School::with('groups')->withCount('groups')->get();

        return view('admin.kindergartens.edit', compact('schools', 'school'));
    }

    public function adminUpdate(UpdateSchool $request, $id)
    {
        $school = School::where('id', $id)->first();

        $school->name = $request->name;
        $school->save();

        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно оновлено!');
    }

    public function adminDelete($id)
    {
        $school = School::find($id);

        $posts = Post::where('school_id', $id)->get();
        foreach ($posts as $post){
            $post->groups()->detach();

            $this->deletePreviousPreviewImage($post->preview);
            if ($post->image && !is_null($post->image)) {
                $this->deletePreviousEncodeImages($post->image);
            }
            $post->delete();
        }

        $groups = Group::where('school_id', $school->id)->delete();

        $school->nutritions()->delete();
        $school->schedules()->delete();

        User::where('type', 'moderator')->where('school_id', $school->id)->update(['group_id' => null, 'school_id' => null, 'status' => 'disable']);
        User::where('type', 'default')->each(function($user) {
            if (isset($user->avatar) && !is_null($user->avatar)){
                $image = public_path() . $user->avatar;
                if (file_exists($image)) {
                    unlink($image);
                }
            }

            $user->delete();
        });

        $school->delete();

        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно видалено!');
    }

    public function deletePreviousPreviewImage($data)
    {
        $preview = public_path() . $data;
        if (file_exists($preview)) {
            unlink($preview);
        }

        return true;
    }

    public function deletePreviousEncodeImages($data)
    {
        foreach (json_decode($data) as $image) {
            $old_image = public_path() . $image;
            if (file_exists($old_image)) {
                unlink($old_image);
            }
        }

        return true;
    }
}
