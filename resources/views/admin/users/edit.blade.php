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
                                               class="form-control" placeholder="ФИО ребенка">

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Дата народження дитини</label>
                                        <input required name="birthday" value="{{ $user->birthday }}" type="date"
                                               class="form-control" placeholder="Дата Рождения ребенка">

                                        @if ($errors->has('birthday'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('birthday') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ПІБ Батька</label>
                                        <input required name="parent_name" value="{{ $user->parent_name }}" type="text"
                                               class="form-control" placeholder="ФИО Родителя">

                                        @if ($errors->has('parent_name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('parent_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Номер Телефону Батьків</label>
                                        <input required name="parent_phone" value="{{ $user->parent_phone }}"
                                               type="text" class="form-control" placeholder="Номер Телефона Родителя">

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
                                               class="form-control" id="email"
                                               placeholder="name@example.com">

                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Адреса</label>
                                        <input required type="text" value="{{ $user->address }}" name="address"
                                               class="form-control" id="address"
                                               placeholder="Адрес">

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
                                        <label for="password-confirm">Пароль підтвердження</label>
                                        <input id="password-confirm" type="password" class="form-control"
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
                                        <select required name="school_id" class="form-control"
                                                id="exampleFormControlSelect1">

                                            @foreach($schools as $school)
                                                <option @if($school->id == $user->school_id) selected
                                                        @endif value="{{ $school->id }}">{{ $school->name }}</option>
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
                                        <select required name="group_id" class="form-control"
                                                id="exampleFormControlSelect2">

                                            @foreach($groups as $group)
                                                <option @if($group->id == $user->group_id) selected
                                                        @endif value="{{ $group->id }}">{{ $group->name }}</option>
                                            @endforeach

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

                            <button type="submit" class="btn btn-primary mb-2">Обновить</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')

@endsection
