@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Главная Страница</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/posts') }}">Новости</a>
            </li>
            <li class="breadcrumb-item">Создание новости</li>
        </ol>


        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Создать Новость</h2>
                    </div>

                    <div class="card-body">


                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif


                        <form action="{{ action('PostsController@adminStore') }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-row">

                                        <div class="form-group col-md-8">
                                            <label for="exampleFormControlInput1">Название</label>
                                            <input required name="title" value="{{ old('title') }}" type="text"
                                                   class="form-control {{ $errors->has('title') ? ' is-invalid' : '' }}"
                                                   placeholder="Название">

                                            @if ($errors->has('title'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">Дата До</label>
                                            <input required name="until" value="{{ old('until') }}" type="date"
                                                   class="form-control {{ $errors->has('until') ? ' is-invalid' : '' }}"
                                                   placeholder="Название">

                                            @if ($errors->has('until'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('until') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label for="exampleFormControlInput1">Описание</label>
                                            <textarea required name="body" type="text"
                                                      class="form-control {{ $errors->has('body') ? ' is-invalid' : '' }}"
                                                      placeholder="Описание">{{ old('body') }}</textarea>

                                            @if ($errors->has('body'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('body') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <h5>Upload Preview</h5>
                                            <input required name="image" type='file' onchange="readURL(this);"/>

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
                                            <h5>Upload Image</h5>
                                            <input required name="preview" type='file' onchange="readURL2(this);"/>

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
                                <div class="col-md-6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Садик</label>

                                            @foreach($schools as $school)

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        {{ $school->name }}
                                                        <input required value="{{ $school->id }}" type="radio"
                                                               value="{{ old('school_id') }}" name="school_id">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                            @endforeach

                                            @if ($errors->has('school_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('school_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Группы</label>

                                            @foreach($groups as $group)

                                                <div class="form-check">
                                                    <label class="container">
                                                        {{ $group->name }}
                                                        <input value="{{ $group->id }}" name="group_id[]" type="checkbox">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>

                                            @endforeach

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Создать</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')

    <script src="{{ asset('administrator/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('administrator/js/dataTables.bootstrap4.js') }}"></script>

    <script>
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


        $(document).ready(function () {
            $('#dataTable').DataTable();

        });
    </script>
@endsection
