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
                <a class="orange-text" href="{{ url('admin/users') }}">Пользователи</a>
            </li>
            <li class="breadcrumb-item ">
                {{ $user->name }}
            </li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Создать Пользователя</h2>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                @if (Session::has('message'))
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        {{Session::get('message')}}
                                    </div>
                                @endif
                            </div>
                        </div>

                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif


                        <form action="{{ action('StudentsController@adminUpdate', $user->id) }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ПІБ дитини</label>
                                        <input required name="name" value="{{ $user->name }}" type="text"
                                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}" placeholder="ПІБ дитини">

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Дата народження дитини</label>
                                        <input required name="birthday" value="{{ $user->birthday }}" type="date"
                                               class="form-control {{ $errors->has('birthday') ? ' is-invalid' : '' }}" placeholder="Дата народження дитини">

                                        @if ($errors->has('birthday'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('birthday') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ПІБ Батька</label>
                                        <input required name="parent_name" value="{{ $user->parent_name }}" type="text"
                                               class="form-control {{ $errors->has('parent_name') ? ' is-invalid' : '' }}" placeholder="ПІБ Батька">

                                        @if ($errors->has('parent_name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('parent_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Номер Телефону Батьків</label>
                                        <input required name="parent_phone" value="{{ $user->parent_phone }}"
                                               type="text" class="form-control {{ $errors->has('parent_phone') ? ' is-invalid' : '' }}" placeholder="Номер Телефону Батьків">

                                        @if ($errors->has('parent_phone'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('parent_phone') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Email</label>
                                        <input required type="email" value="{{ $user->email }}" name="email"
                                               class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}" id="email" readonly
                                               placeholder="name@example.com">

                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Адреса</label>
                                        <input type="text" value="{{ $user->address }}" name="address"
                                               class="form-control {{ $errors->has('address') ? ' is-invalid' : '' }}" id="address"
                                               placeholder="Адреса">

                                        @if ($errors->has('address'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('address') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input id="password" type="password"
                                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                               minlength=6 name="password">

                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm">Підтвердження паролю</label>
                                        <input id="password-confirm" type="password" class="form-control {{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                               minlength=6 name="password_confirmation">

                                        @if ($errors->has('password_confirmation'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password_confirmation') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Садок</label>
                                        <select required name="school_id" class="form-control choose_school {{ $errors->has('school_id') ? ' is-invalid' : '' }}"
                                                id="exampleFormControlSelect1">

                                            @foreach($schools as $school)
                                                <option class="choose_school_option"
                                                        @if($school->id == $user->school_id) selected @endif
                                                        value="{{ $school->id }}">{{ $school->name }}
                                                </option>
                                            @endforeach

                                        </select>

                                        @if ($errors->has('school_id'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('school_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect2">Група</label>
                                        <select required name="group_id" class="form-control choose_group_option {{ $errors->has('group_id') ? ' is-invalid' : '' }}"
                                                id="exampleFormControlSelect2">
                                                <option selected value="{{ $user->group->id }}">{{ $user->group->name }}</option>
                                        </select>

                                        @if ($errors->has('group_id'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('group_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <label>Статус</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Активний
                                                        <input required value="active" type="radio"
                                                               @if($user->status == "active") checked
                                                               @endif  name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Неактивний
                                                        <input required value="disable" type="radio"
                                                               @if($user->status == "disable") checked
                                                               @endif name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                                @if ($errors->has('status'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('status') }}</strong>
                                                    </span>
                                                @endif
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Батько / Мати</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Батько
                                                        <input required value="father" type="radio"
                                                               @if($user->parents == "father") checked
                                                               @endif name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Мати
                                                        <input required value="mother" type="radio"
                                                               @if($user->parents == "mother") checked
                                                               @endif name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                                @if ($errors->has('parents'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('parents') }}</strong>
                                                    </span>
                                                @endif
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
            $('.choose_school').on('change', function () {
                var school_id = $(this).val();
                if (school_id) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },

                        type: 'POST',
                        url: '/admin/users/getAllGroupsById',
                        dataType: 'json',
                        data: {id: school_id},
                        success: function (data) {

                            if (data.success) {
                                $('.choose_group_option').empty();

                                if (data.data && data.data !== '') {
                                    $.each(data.data, function (index, item) {
                                        console.log(item);
                                        $('.choose_group_option').append('<option  value="' + item.id + '">' + item.name + '</option>');
                                    });
                                } else {
                                    console.log("empty data");
                                    $('.choose_group_option').empty();
                                }
                            }

                        }, error: function () {
                            console.log(data);
                        }
                    });
                }
            });
        });
    </script>
@endsection
