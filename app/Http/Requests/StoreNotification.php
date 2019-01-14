<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreNotification extends FormRequest
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
            'title' => 'required',
            'message' => 'required',
            'school_id' => 'required',
            'group_id' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Заголовок обов\'язкове поле!',
            'body.message' => 'Назва повiдомлення обов\'язкове поле!',
            'school_id.required' => 'Виберіть школи!',
            'group_id.required' => 'Виберіть групи!',
        ];
    }
}
