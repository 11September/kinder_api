@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/posts') }}">Новини</a>
            </li>
            <li class="breadcrumb-item active">
                {{ $post->title }}
            </li>
        </ol>


        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Редагувати новини</h2>
                    </div>

                    <div class="card-body">

                        @include('admin.partials.errors')

                        <form action="{{ action('PostsController@adminUpdate', $post->id) }}"
                              enctype="multipart/form-data" method="post">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-row">

                                        <div class="form-group col-md-8">
                                            <label for="exampleFormControlInput1">Назва</label>
                                            <input required name="title" value="{{ $post->title }}" type="text"
                                                   class="form-control {{ $errors->has('title') ? ' is-invalid' : '' }}"
                                                   placeholder="Назва">

                                            @if ($errors->has('title'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">Дата До</label>
                                            <input required name="until" value="{{ $post->until }}" type="date"
                                                   max="2100-01-01"
                                                   class="form-control {{ $errors->has('until') ? ' is-invalid' : '' }}"
                                                   placeholder="Дата До">

                                            @if ($errors->has('until'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('until') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label for="exampleFormControlInput1">Опис</label>
                                            <textarea required name="body" type="text" rows="5"
                                                      class="form-control {{ $errors->has('body') ? ' is-invalid' : '' }}"
                                                      placeholder="Опис">{{ $post->body }}</textarea>

                                            @if ($errors->has('body'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('body') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <h5>Завантажити попередній перегляд</h5>
                                            <input name="old_preview" type="hidden" value="{{ $post->preview }}">
                                            <input value="{{ $post->preview }}" name="preview" type='file'
                                                   onchange="readURL2(this);"/>

                                            @if ($errors->has('preview'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('preview') }}</strong>
                                                </span>
                                            @endif

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <img class="post-image-preview" id="blah2"
                                                         src="{{ asset($post->preview) }}" alt="your image"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <h5>Завантажити зображення</h5>
                                            <input name="old_image" type="hidden" value="{{ $post->image }}">
                                            <input value="{{ $post->image }}" name="image[]" type='file'
                                                   onchange="readURL(this);" multiple/>

                                            @if ($errors->has('image'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('image') }}</strong>
                                                </span>
                                            @endif


                                            <div class="row">

                                                @if(json_decode($post->image))
                                                    @foreach(json_decode($post->image) as $image)
                                                        <div class="wrapper-many-post-images">
                                                            <img class="post-image-preview many-post-images" id="blah"
                                                                 src="{{ asset($image) }}" alt="your Preview"/>
                                                        </div>
                                                    @endforeach
                                                @endif

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Садок</label>

                                            <div class="wrapper-schools-holder">
                                                @foreach($schools as $school)

                                                    <div class="form-check">
                                                        <label class="container-checkbox">
                                                            {{ $school->name }}
                                                            <input required value="{{ $school->id }}" type="radio"
                                                                   name="school_id"
                                                                   @if($school->id == $post->school_id) checked @endif>
                                                            <span class="checkmark-radio"></span>
                                                        </label>
                                                    </div>

                                                @endforeach
                                            </div>

                                            @if ($errors->has('school_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('school_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Групи</label>

                                            <div class="wrapper-all-schools-and-check-all">
                                                <div class="wrapper-groups-holder">
                                                    @foreach($groups as $group)

                                                        <div class="form-check">
                                                            <label class="container">
                                                                {{ $group->name }}
                                                                <input

                                                                    @foreach($post->groups as $post_group)
                                                                    @if($group->id == $post_group->id) checked @endif
                                                                    @endforeach

                                                                    value="{{ $group->id }}" name="group_id[]"
                                                                    type="checkbox">
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>

                                                    @endforeach
                                                </div>

                                                <div class="wrapper-check-all">
                                                    <div class="form-check">
                                                        <label class="container">
                                                            Відзначити всі
                                                            <input value="all" class="all-schools" name="all"
                                                                   type="checkbox">
                                                            <span class="checkmark"></span>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Оновити</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            $(".all-schools[type='checkbox']").change(function () {
                if ($(this).prop("checked")) {
                    $("input[name='group_id[]']").prop('checked', true);
                }else{
                    $("input[name='group_id[]']").prop('checked', false);
                }
            });

            $('input[type=radio][name=school_id]').change(function () {
                var school_id = $(this).val();

                if (school_id) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },

                        type: 'POST',
                        url: '/admin/groups/getAllGroupsById',
                        dataType: 'json',
                        data: {id: school_id},
                        success: function (data) {
                            var content = $('.wrapper-groups-holder');
                            var required = null;

                            if (data.success) {
                                content.empty();
                                if (data.data && data.data !== '') {
                                    $.each(data.data, function (index, item) {
                                        console.log(item);

                                        content.append(
                                            '<div class="form-check">' +
                                            '<label class="container">' + item.name +
                                            '<input value="' + item.id + '" name="group_id[]" type="checkbox">' +
                                            '<span class="checkmark"></span>' +
                                            '</label>' +
                                            '</div>'
                                        );
                                    });
                                } else {
                                    content.empty();
                                }
                            }

                        }, error: function () {
                            console.log(data);
                        }
                    });
                }
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result);
                };

                $('input[name=\'old_image\']').val('');
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah2')
                        .attr('src', e.target.result);
                };

                $('input[name=\'old_preview\']').val('');
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
@endsection
