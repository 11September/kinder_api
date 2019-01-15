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
            'school_id' => 'required_unless:all,all',
            'group_id' => 'required_unless:all,all',
            'all' => 'required_without:school_id|required_without:group_id'
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Заголовок обов\'язкове поле!',
            'body.message' => 'Назва повiдомлення обов\'язкове поле!',
            'school_id.required_unless' => 'Віберіть школи або виберіть відправку всім користувачам!',
            'group_id.required_unless' => 'Виберіть групи або виберіть відправку всім користувачам!',
            'all.required_without' => 'Виберіть школи, групи або виберіть відправку всім користувачам!',
        ];
    }
}
