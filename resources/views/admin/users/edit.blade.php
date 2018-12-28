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
                                        <label for="exampleFormControlInput1">ФИО ребенка</label>
                                        <input required name="name" value="{{ $user->name }}" type="text"
                                               class="form-control" placeholder="ФИО ребенка">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Дата Рождения ребенка</label>
                                        <input required name="birthday" value="{{ $user->birthday }}" type="date"
                                               class="form-control" placeholder="Дата Рождения ребенка">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ФИО Родителя</label>
                                        <input required name="parent_name" value="{{ $user->parent_name }}" type="text"
                                               class="form-control" placeholder="ФИО Родителя">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Номер Телефона Родителя</label>
                                        <input required name="parent_phone" value="{{ $user->parent_phone }}"
                                               type="text" class="form-control" placeholder="Номер Телефона Родителя">
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Email</label>
                                        <input required type="email" value="{{ $user->email }}" name="email" class="form-control" id="email"
                                               placeholder="name@example.com">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Адрес</label>
                                        <input required type="text" value="{{ $user->address }}" name="address" class="form-control" id="address"
                                               placeholder="Адрес">
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" type="password"
                                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                               minlength=6 name="password">
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm">Password Confirm</label>
                                        <input id="password-confirm" type="password" class="form-control"
                                               minlength=6 name="password_confirmation">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Садик</label>
                                        <select required name="school_id" class="form-control" id="exampleFormControlSelect1">

                                            @foreach($schools as $school)
                                                <option @if($school->id == $user->school_id) selected @endif value="{{ $school->id }}">{{ $school->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Группа</label>
                                        <select required name="group_id" class="form-control" id="exampleFormControlSelect1">

                                            @foreach($groups as $group)
                                                <option @if($group->id == $user->group_id) selected @endif value="{{ $group->id }}">{{ $group->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <label>Статус</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Активный
                                                        <input required value="active" type="radio"
                                                               @if($user->status == "active") checked @endif  name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Неактивный
                                                        <input required value="disable" type="radio"
                                                               @if($user->status == "disable") checked @endif name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Пол</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Батько
                                                        <input required value="father" type="radio"
                                                               @if($user->parents == "father") checked @endif name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Мати
                                                        <input required value="mother" type="radio"
                                                               @if($user->parents == "mother") checked @endif name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
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
