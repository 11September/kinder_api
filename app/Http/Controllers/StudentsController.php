<?php

namespace App\Http\Controllers;

use App\User;
use App\Group;
use App\School;
use App\Mail\LoginMail;
use App\Mail\DeleteProfile;
use App\Http\Requests\StoreStudent;
use App\Http\Requests\UpdateStudent;
use Illuminate\Support\Facades\Hash;

class StudentsController extends Controller
{
    public function adminIndex()
    {
        $users = User::where('type', 'default')
            ->with(array('school' => function ($query) {
                $query->select('id', 'name');
            }))
            ->with(array('group' => function ($query) {
                $query->select('id', 'name');
            }))
            ->latest()
            ->get();

        return view('admin.users', compact('users'));
    }

    public function adminCreate()
    {
        $schools = School::all();

        if ($schools->first()){
            $groups = Group::where('school_id', $schools->first()->id)->get();
        }else{
            $groups = [];
        }

        return view('admin.users.create', compact('schools', 'groups'));
    }

    public function adminStore(StoreStudent $request)
    {
        $password = $request->password;

        $user = new User();
        $user->name = $request->name;
        $user->birthday = $request->birthday;
        $user->parent_name = $request->parent_name;
        $user->parent_phone = $request->parent_phone;
        $user->parents = $request->parents;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->school_id = $request->school_id;
        $user->group_id = $request->group_id;
        $user->status = $request->status;

        $user->password = Hash::make($request->password);
        $user->token = Hash::make($request->email);

        $user->save();

        $user->load('group');
        $user->load('school');

        \Mail::to($request->email)->send(new LoginMail($user, $password));

        return redirect()->route('users')->with('message', 'Користувач успішно доданий! Перевiрте пошту!');
    }

    public function adminEdit($id)
    {
        $user = User::where('id', $id)->with('group', 'school')->first();

        $schools = School::all();

        $groups = Group::where('school_id', $user->school->id)->get();

        return view('admin.users.edit', compact('user', 'groups', 'schools'));
    }

    public function adminUpdate(UpdateStudent $request, User $user)
    {
        if ($request->password && !empty($request->password) && ($request->password == $request->password_confirmation)) {
            $user->password = Hash::make($request->password);
        }

        if ($request->password && $request->password_confirmation && ($request->password !== $request->password_confirmation) && (iconv_strlen($request->password < 7)) && (iconv_strlen($request->password_confirmation < 7))) {
            return redirect()->back()->with('message', 'Паролі не збігаються або не відповідають формату!');
        }

        if ($request->password && $request->password_confirmation && $request->password !== $request->password_confirmation) {
            return redirect()->back()->with('message', 'Паролі не збігаються або не відповідають формату!');
        }

        $user->update([
            'name' => $request->name,
            'birthday' => $request->birthday,
            'parent_name' => $request->parent_name,
            'parent_phone' => $request->parent_phone,
            'parents' => $request->parents,
            'email' => $request->email,
            'address' => $request->address,
            'school_id' => $request->school_id,
            'group_id' => $request->group_id,
            'status' => $request->status,
        ]);

        $user->save();

        return redirect()->route('users')->with('message', 'Користувач успішно оновлений!');
    }

    public function adminDelete($id)
    {
        $user = User::find($id);
        $mailTo = $user->email;

        if ($user->avatar && !empty($user->avatar)) {
            $image = public_path() . $user->avatar;
            if (file_exists($image)) {
                unlink($image);
            }
        }

        $user->delete();

        \Mail::to($mailTo)->send(new DeleteProfile($user));

        return redirect()->route('users')->with('message', 'Користувач успішно видалений!');
    }

}
