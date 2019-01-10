<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreStudent extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string',
            'birthday' => 'required|string',
            'parent_name' => 'required|string',
            'parent_phone' => 'required',
            'parents' => 'required',
            'email' => 'required|string|email|max:255|unique:users',
            'address' => 'required',
            'password' => 'required|string|min:6|max:255|confirmed',
            'school_id' => 'required',
            'group_id' => 'required',
            'status' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => "ПІБ дитини обов'язкове поле",
            'birthday.required' => "Дата народження дитини обов'язкове поле",
            'parent_name.required' => "ПІБ батьків обов'язкове поле",
            'parent_phone.required' => "Номер телефону батьків обов'язкове поле",
            'email.required' => "Email батьків обов'язкове поле",
            'address.required' => "Адреса батьків обов'язкове поле",
            'password.required' => "Пароль обов'язкове поле",
            'school_id.required' => "Садок обов'язкове поле",
            'group_id.required' => "Група обов'язкове поле",
            'status.required' => "Статус обов'язкове поле",
            'parents.required' => "ВибБатько / Мати обов'язкове поле",

            'email.email' => "Email маэ бути згiдно формату",
            'email.unique' => "Такий емейл існує",
            'password.confirmed' => "Паролі повинні співпадати",
        ];
    }
}
