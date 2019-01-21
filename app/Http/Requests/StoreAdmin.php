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
            'password.confirmed' => "Паролі повинні співпадати",

            'type.required' => "Роль обов'язкове поле"
        ];
    }
}