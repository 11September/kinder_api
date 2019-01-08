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
            'name' => 'required',
            'birthday' => 'required',
            'parent_name' => 'required',
            'parent_phone' => 'required',
            'parents' => 'required',
            'email' => 'required',
            'address' => 'required',
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
        ];
    }
}
