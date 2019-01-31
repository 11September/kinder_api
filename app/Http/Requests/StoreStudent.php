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
            'name' => 'required|string|min:6',
            'birthday' => 'required|date',
            'parent_name' => 'required|string|min:6',
            'parent_phone' => 'required|string|min:10|max:18|unique:users,parent_phone',
            'parents' => 'required',
            'email' => 'required|string|email|max:255|unique:users',
            'address' => 'min:6',
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
            'name.min' => "ПІБ дитини повинен містити не менше 6 символів",

            'birthday.required' => "Дата народження дитини обов'язкове поле",
            'birthday.date' => "Дата народження має бути датою",

            'parent_name.required' => "ПІБ батьків обов'язкове поле",
            'parent_name.min' => "ПІБ батьків повинен містити не менше 6 символів",

            'parent_phone.required' => "Номер телефону батьків обов'язкове поле",
            'parent_phone.unique' => "Номер телефону вже прив'язаний до користувача",

            'email.required' => "Email батьків обов'язкове поле",
            'email.email' => "Email маэ бути згiдно формату",
            'email.unique' => "Email повинен бути унікальним",

            'address.required' => "Адреса батьків обов'язкове поле",
            'address.min' => "Мінімальна кількість символів 6 для адреси",

            'password.required' => "Пароль обов'язкове поле",
            'password.min' => "Пароль повинен містити не менше 6 символів",
            'password.confirmed' => "Паролі повинні співпадати",

            'school_id.required' => "Садок обов'язкове поле",
            'group_id.required' => "Група обов'язкове поле",
            'status.required' => "Статус обов'язкове поле",
            'parents.required' => "ВибБатько / Мати обов'язкове поле",

            'parent_phone.min' => "Мінімальна кількість символів 10 для номеру телефона",
            'parent_phone.max' => "Максимальна кількість символів 13 для номеру телефона",
        ];
    }
}
