<?php
namespace App\Http\Controllers;

use App\Group;
use App\Http\Requests\StoreSchool;
use App\School;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
class SchoolController extends Controller
{
    public function index(Request $request)
    {
        try {
            $dishes = School::select('id', 'name')
                ->filter($request)
                ->published()
                ->get();

        } catch (\Exception $exception) {
            Log::warning('DishesController@index Exception: '. $exception->getMessage());
            return response()->json(['message' => 'Упс! Щось пішло не так!'], 500);
        }
        return response(['data' => $dishes]);
    }


    public function adminIndex()
    {
        $schools = School::withCount(['groups'])->get();

        $groups = Group::all();

        return view('admin.kindergartens',compact('schools', 'groups'));
    }

    public function adminCreate()
    {

    }

    public function adminStore(StoreSchool $request)
    {
        $school = new School();
        $school->name = $request->name;
        $school->save();

        $school->groups()->sync($request->group_id, false);

        return redirect()->route('admin.kindergartens')->with('message','Садик успешно добавлен!');
    }

    public function adminEdit($id)
    {
        $school = School::where('id', $id)->with('groups')->first();

        $groups = Group::all();

        $schools = School::withCount('groups')->get();

        return view('admin.kindergartens.edit',compact('schools', 'groups', 'school'));
    }

    public function adminUpdate(StoreSchool $request, $id)
    {
        $school = School::where('id', $id)->first();

        $school->name = $request->name;
        $school->save();

        $school->groups()->sync($request->group_id, true);

        return redirect()->route('admin.kindergartens')->with('message','Садик успешно обновлён!');
    }

    public function adminDelete($id)
    {
        $school = School::find($id);

        $school->groups()->detach();

        $school->delete();

        return redirect()->route('admin.kindergartens')->with('message','Новость успешно удалена!');
    }
}
