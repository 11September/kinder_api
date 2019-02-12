<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreGroup extends FormRequest
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
            'user_id' => 'required',
            'moderator_id' => 'required',
            'school_id' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Назва групи обов\'язкове!',
            'user_id.required' => 'Адміністратор групи обов\'язкове поле!',
            'moderator_id.required' => 'Вихователь групи обов\'язковий. Створіть вихователя або виберіть існуючого!',
            'school_id.required' => 'Виберіть школу!',
        ];
    }
}
