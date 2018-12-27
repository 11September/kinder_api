@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Главная страница</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/users') }}">Пользователи</a>
            </li>
            <li class="breadcrumb-item ">
                Создание пользователя
            </li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Создать Пользователя</h2>
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


                        <form action="{{ action('StudentsController@adminStore') }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ФИО ребенка</label>
                                        <input required name="name" value="{{ old('name') }}" type="text"
                                               class="form-control" placeholder="ФИО ребенка">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Дата Рождения ребенка</label>
                                        <input required name="birthday" value="{{ old('birthday') }}" type="date"
                                               class="form-control" placeholder="Дата Рождения ребенка">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ФИО Родителя</label>
                                        <input required name="parent_name" value="{{ old('parent_name') }}" type="text"
                                               class="form-control" placeholder="ФИО Родителя">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Номер Телефона Родителя</label>
                                        <input required name="parent_phone" value="{{ old('parent_phone') }}"
                                               type="text" class="form-control" placeholder="Номер Телефона Родителя">
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Батько
                                            <input required value="father" type="radio"
                                                   checked="checked" name="parents">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Мати
                                            <input required value="mother" type="radio"
                                                   checked="checked" name="parents">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Email</label>
                                        <input required type="email" name="email" class="form-control" id="email"
                                               placeholder="name@example.com">
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Адрес</label>
                                        <input required type="text" name="address" class="form-control" id="address"
                                               placeholder="Адрес">
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" type="password"
                                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                               name="password" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm">Password Confirm</label>
                                        <input id="password-confirm" type="password" class="form-control"
                                               name="password_confirmation" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Садик</label>
                                        <select required name="school_id" class="form-control" id="exampleFormControlSelect1">

                                            @foreach($schools as $school)
                                                <option value="{{ $school->id }}">{{ $school->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Группа</label>
                                        <select required name="group_id" class="form-control" id="exampleFormControlSelect1">

                                            @foreach($groups as $group)
                                                <option value="{{ $group->id }}">{{ $group->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlSelect1">Статус</label>
                                        <select required name="status" class="form-control" id="exampleFormControlSelect1">
                                            <option value="active">Активный</option>
                                            <option value="disable">Неактивный</option>
                                        </select>
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

@endsection
