<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateStudent extends FormRequest
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
            'birthday' => 'required|date',
            'parent_name' => 'required|string',
            'parent_phone' => 'required|string|min:10|max:13',
            'parents' => 'required',
            'email' => 'required|string|email|max:255',
            'address' => '',
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

            'birthday.date' => "День народження має бути датою",

            'parent_phone.min' => "Мінімальна кількість символів 10 для номеру телефона",
            'parent_phone.max' => "Мінімальна кількість символів 13 для номеру телефона",

            'email.email' => "Email маэ бути згiдно формату",
            'email.unique' => "Такий емейл існує",
            'password.confirmed' => "Паролі повинні співпадати",
        ];
    }
}
