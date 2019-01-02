<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePost extends FormRequest
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
            'title' => 'required|min:6',
            'body' => 'required',
            'until' => 'required|date',
            'school_id' => 'required',
            'preview' => 'required|image',
            'image' => 'required|image',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Название новости обязательное!',
            'title.min' => 'Минимальное кол-во символов - 6',
            'body.required' => 'Название новости обязательное!',
            'until.required' => 'Название новости обязательное!',
            'until.date' => 'Укажите дату!',
            'school_id.required' => 'Название новости обязательное!',
            'preview.required'  => 'Картинка анонса обязательна',
            'image.required'  => 'Картинка к посту обязательное',

            'preview.image'  => 'Формат картинки',
            'image.image'  => 'Формат картинки',
        ];
    }
}