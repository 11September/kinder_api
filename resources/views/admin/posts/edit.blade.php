@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Главная Страница</a>
            </li>
            <li class="breadcrumb-item">
                <a href="{{ url('admin/posts') }}">Новости</a>
            </li>
            <li class="breadcrumb-item active">
                {{ $post->title }}
            </li>
        </ol>


        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Редактировать новость</h2>
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

                        <form action="{{ action('PostsController@adminUpdate', $post->id) }}" enctype="multipart/form-data" method="post">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-row">

                                        <div class="form-group col-md-8">
                                            <label for="exampleFormControlInput1">Название</label>
                                            <input required name="title" value="{{ $post->title }}" type="text" class="form-control"
                                                   placeholder="Название">
                                        </div>

                                        <div class="form-group col-md-4">
                                            <label for="exampleFormControlInput1">Дата До</label>
                                            <input required name="until" value="{{ $post->until }}" type="date" class="form-control"
                                                   placeholder="Название">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label for="exampleFormControlInput1">Описание</label>
                                            <textarea required name="body" type="text" class="form-control"
                                                      placeholder="Описание">{{ $post->body }}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Садик</label>

                                            @foreach($schools as $school)
                                                <div class="form-check">
                                                    <input required class="form-check-input" type="radio" name="school_id"
                                                           id="{{ $school->id }}" value="{{ $school->id }}"
                                                        @if($school->id == $post->school_id) checked
                                                        @endif
                                                    >
                                                    <label class="form-check-label" for="{{ $school->id }}">
                                                        {{ $school->name }}
                                                    </label>
                                                </div>
                                            @endforeach
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Группы</label>

                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value=""
                                                       id="defaultCheck1">
                                                <label class="form-check-label" for="defaultCheck1">
                                                    Default checkbox
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value=""
                                                       id="defaultCheck2">
                                                <label class="form-check-label" for="defaultCheck2">
                                                    Disabled checkbox
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-9">

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <h5>Upload Preview</h5>
                                            <input name="old_image" type="hidden" value="{{ $post->image }}">
                                            <input value="{{ $post->image }}" name="image" type='file' onchange="readURL(this);" />
                                            <img id="blah" src="{{ asset($post->image) }}" alt="your Preview" />
                                        </div>

                                        <div class="form-group col-md-6">
                                            <h5>Upload Image</h5>
                                            <input name="old_preview" type="hidden" value="{{ $post->preview }}">
                                            <input value="{{ $post->preview }}" name="preview" type='file' onchange="readURL2(this);" />
                                            <img id="blah2" src="{{ asset($post->preview) }}" alt="your image" />
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-3"></div>
                            </div>


                            <button type="submit" class="btn btn-primary mb-2">Обновить</button>
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


        $(document).ready(function () {
            $('#dataTable').DataTable();

        });
    </script>
@endsection
