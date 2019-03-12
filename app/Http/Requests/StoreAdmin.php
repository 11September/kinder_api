<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreAdmin extends FormRequest
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
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|max:255|confirmed',
            'birthday' => 'date|nullable',
            'type' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => "ПІБ дитини обов'язкове поле",

            'email.required' => "Email батьків обов'язкове поле",
            'email.email' => "Email маэ бути згiдно формату",
            'email.unique' => "Такий емейл існує",

            'password.required' => "Пароль обов'язкове поле",
            'password.min' => "Пароль повинен містити не менше 6 символів",
            'password.max' => "Пароль повинен містити максимум 255 символів",
            'password.confirmed' => "Паролі повинні співпадати",

            'birthday.required' => "Дата народження дитини обов'язкове поле",
            'birthday.date' => "Дата народження має бути датою",
            'type.required' => "Роль обов'язкове поле"
        ];
    }
}
