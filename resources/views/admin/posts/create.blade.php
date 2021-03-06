@extends('admin.template.master')

@section('css')

@endsection

@section('content')
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/posts') }}">Новини</a>
            </li>
            <li class="breadcrumb-item">Створення новини</li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Створення новини</h2>
                    </div>

                    <div class="card-body">

                        @include('admin.partials.errors')

                        <form class="post-form" action="{{ action('PostsController@adminStore') }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row posts-wrapper-flex">
                                <div class="col-xl-7 col-md-6">
                                    <div class="form-row">

                                        <div class="form-group col-xl-8 col-lg-7 col-md-12 col-sm-12">
                                            <label for="title">Назва</label>
                                            <input required name="title" value="{{ old('title') }}" type="text" id="title"
                                                   class="form-control {{ $errors->has('title') ? ' is-invalid' : '' }}"
                                                   placeholder="Назва">

                                            @if ($errors->has('title'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-xl-4 col-lg-5 col-md-12 col-sm-12">
                                            <label for="until">Дата До</label>
                                            <input required name="until" value="{{ old('until') }}" type="date" max="2100-01-01"
                                                   class="form-control {{ $errors->has('until') ? ' is-invalid' : '' }}" id="until"
                                                   placeholder="Дата До">

                                            @if ($errors->has('until'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('until') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label for="body">Опис</label>
                                            <textarea required name="body" type="text" rows="5" id="body"
                                                      class="form-control {{ $errors->has('body') ? ' is-invalid' : '' }}"
                                                      placeholder="Опис">{{ old('body') }}</textarea>

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
                                            <input required name="preview" type='file' onchange="readURL(this);"/>

                                            @if ($errors->has('image'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('image') }}</strong>
                                                </span>
                                            @endif

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <img class="post-image-preview" id="blah"
                                                         src="http://placehold.it/180" alt="your Preview"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <h5>Завантажити зображення</h5>
                                            <input name="image[]" type='file' onchange="readURL2(this);" multiple/>

                                            @if ($errors->has('preview'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('preview') }}</strong>
                                                </span>
                                            @endif

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <img class="post-image-preview" id="blah2"
                                                         src="http://placehold.it/180"
                                                         alt="your image"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-5 col-md-6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Садок</label>

                                            <div class="wrapper-schools-holder">

                                                @foreach($schools as $school)
                                                    <div class="form-check">
                                                        <label class="container-checkbox">
                                                            {{ $school->name }}
                                                            <input required value="{{ $school->id }}" type="radio"
                                                                   @if ($loop->first) checked @endif
                                                                   value="{{ old('school_id') }}" name="school_id">
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
                                                                <input value="{{ $group->id }}" name="group_id[]"
                                                                       type="checkbox" @if ($loop->first) checked @endif>
                                                                <span class="checkmark"></span>
                                                            </label>
                                                        </div>
                                                    @endforeach
                                                </div>

                                                <div class="wrapper-check-all">
                                                    <div class="form-check">
                                                        <label class="container">
                                                            Відзначити всі
                                                            <input value="all" class="all-schools" name="all" type="checkbox">
                                                            <span class="checkmark"></span>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Створити</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')
    <script>
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
        if(dd<10){
            dd='0'+dd
        }
        if(mm<10){
            mm='0'+mm
        }

        today = yyyy+'-'+mm+'-'+dd;
        document.getElementById("until").setAttribute("min", today);

        $(document).ready(function () {
            $(".all-schools[type='checkbox']").change(function () {
                if ($(this).prop("checked")) {
                    $("input[name='group_id[]']").prop('checked', true);
                }else{
                    $("input[name='group_id[]']").prop('checked', false);
                }
            });

            $('input[type=radio][name=school_id]').change(function() {
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
                                        content.append(
                                            '<div class="form-check">' +
                                                '<label class="container">' + item.name +
                                                '<input value="'+ item.id +'" name="group_id[]" type="checkbox">' +
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

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
@endsection
