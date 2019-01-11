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
            'group_id' => 'required',
            'preview' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'image.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'Название новости обязательное!',
            'title.min' => 'Минимальное кол-во символов в назвi - 6!',
            'body.required' => 'Название новости обязательное!',
            'until.required' => 'Название новости обязательное!',
            'until.date' => 'Укажите дату!',
            'school_id.required' => 'Название новости обязательное!',
            'group_id.required' => 'Выберите группы!',
            'preview.required'  => 'Картинка анонса обязательна',
            'image.required'  => 'Картинка к посту обязательное',

            'preview.image'  => 'Формат картинки',
            'image.image'  => 'Формат картинки',
            'preview.mimes'  => 'Перевірте формат зображення',
            'image.mimes'  => 'Перевірте формат зображення',
        ];
    }
}
