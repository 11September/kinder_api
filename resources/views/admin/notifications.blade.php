@extends('admin.template.master')

@section('css')

@endsection

@section('content')
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Повідомлення</li>
        </ol>

        <div class="card mb-3">
            <div class="card-header">
                <div class="row">

                    <div class="col-md-12">
                        @if (Session::has('message'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                {{Session::get('message')}}
                            </div>
                        @endif
                    </div>

                    @include('admin.partials.errors')

                    <div class="col-md-12">
                        <div class="notification-flex-center">
                            <p>
                                <i class="fas fa-table"></i>
                                Створення повідомлення
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <form method="post" action="{{ action("NotificationsController@adminStore") }}">
                    {{ csrf_field() }}

                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <h3>Список садкiв</h3>

                            <div class="wrapper-all-schools-and-check-all">
                                <div class="wrapper-all-schools">
                                    <ul class="list-group list-group-flex">
                                        <div class="">
                                            @foreach($schools as $school)
                                                <div class="form-check">
                                                    <label class="container">
                                                        {{ $school->name }}
                                                        <input value="{{ $school->id }}" class="school_id"
                                                               name="school_id[]"
                                                               type="checkbox">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                            @endforeach

                                            @if ($errors->has('school_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('school_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </ul>
                                </div>
                                <div class="wrapper-check-all">
                                    <div class="form-check">
                                        <label for="all" class="container">
                                            Отправить всем
                                            <input value="all" id="all" class="all-schools" name="all" type="checkbox">
                                            <span class="checkmark"></span>
                                        </label>

                                        @if ($errors->has('school_id'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('school_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-4 col-md-6">
                            <h3>Список Груп</h3>

                            <ul class="list-group list-group-flex">
                                <div class="wrapper-groups-holder">

                                </div>

                                @if ($errors->has('group_id'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('group_id') }}</strong>
                                    </span>
                                @endif
                            </ul>
                        </div>

                        <div class="col-lg-4 col-md-12">
                            <div class="notification-content">
                                <h3>Текст повiдомлення</h3>

                                <div class="form-group">
                                    <input value="{{ old('title') }}" type="text" class="form-control" name="title"
                                           placeholder="Заголовок" required>

                                    @if ($errors->has('title'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                    @endif
                                </div>

                                <div class="form-group">
                                <textarea name="message" class="form-control" rows="5" required
                                          placeholder="Текст повiдомлення">{{ old('message') }}</textarea>

                                    @if ($errors->has('message'))
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('message') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Створити</button>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            $(".all-schools[type='checkbox']").change(function () {
                if ($(this).prop("checked")) {

                    $("input[type='checkbox']").prop('checked', true);
                } else {
                    $('.wrapper-groups-holder div.form-check').remove();
                    $("input[type='checkbox']").prop('checked', false);
                }
            });

            $("input.school_id[type='checkbox']").change(function () {
                var school_id = $(this).val();
                if ($(this).prop("checked")) {
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

                                if (data.success) {
                                    if (data.data && data.data !== '') {
                                        var checked = "";

                                        if ($(".all-schools[type='checkbox']").prop("checked")) {
                                            checked = "checked";
                                        }else{
                                            checked = "";
                                        }

                                        $.each(data.data, function (index, item) {
                                            content.append(
                                                '<div class="form-check" data-school-id="' + school_id + '">' +
                                                '<label class="container">' + item.name +
                                                '<input class="input_group_id" value="' + item.id + '" name="group_id[]" type="checkbox" checked="'+checked+'">' +
                                                '<span class="checkmark"></span>' +
                                                '</label>' +
                                                '</div>'
                                            );
                                        });
                                    }
                                }

                            }, error: function () {
                                console.log(data);
                            }
                        });
                    }
                } else {
                    $('div[data-school-id="' + school_id + '"]').each(function (i, el) {
                        $(this).remove();
                    });
                }
            });
        });
    </script>
@endsection
