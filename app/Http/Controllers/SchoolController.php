<?php

namespace App\Http\Controllers;

use App\Post;
use App\Group;
use App\School;
use Illuminate\Http\Request;
use App\Http\Requests\StoreSchool;
use App\Http\Requests\UpdateSchool;
use Illuminate\Support\Facades\Log;

class SchoolController extends Controller
{
    public function adminIndex()
    {
        $schools = School::withCount(['groups'])->get();

        $groups = Group::with('schools')->get();

        return view('admin.kindergartens', compact('schools', 'groups'));
    }

    public function adminStore(StoreSchool $request)
    {
        $school = new School();
        $school->name = $request->name;
        $school->save();

        $school->groups()->sync($request->group_id);


        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно доданий!');
    }

    public function adminEdit($id)
    {
        $school = School::where('id', $id)->with('groups')->first();

        $groups = Group::with('schools')->get();

        $schools = School::withCount('groups')->get();

        return view('admin.kindergartens.edit', compact('schools', 'groups', 'school'));
    }

    public function adminUpdate(UpdateSchool $request, $id)
    {
        $school = School::where('id', $id)->first();

        $school->name = $request->name;
        $school->save();

        $school->groups()->sync($request->group_id, true);

        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно оновлено!');
    }

    public function adminDelete($id)
    {
        $school = School::find($id);

        $school->groups()->detach();
        $school->nutritions()->delete();

        $school->schedules()->delete();
        $school->students()->delete();

        $posts = Post::where('school_id', $id)->get();

        foreach ($posts as $post){
            $post->groups()->detach();
            $post->delete();
        }

        $school->delete();

        return redirect()->route('admin.kindergartens')->with('message', 'Садок успішно видалено!');
    }
}
