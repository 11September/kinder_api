<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateAdmin extends FormRequest
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
            'email' => [
                'required',
                'string',
                'max:255',
                'email',
                Rule::unique('users')->ignore($this->user->id, 'id')
            ],
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

            'type.required' => "Роль обов'язкове поле"
        ];
    }
}
