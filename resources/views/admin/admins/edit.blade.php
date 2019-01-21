@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/admins') }}">Адміністрація</a>
            </li>
            <li class="breadcrumb-item ">
                {{ $user->name }}
            </li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>{{ $user->name }}</h2>
                    </div>

                    <div class="card-body">

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
                        </div>

                        @include('admin.partials.errors')

                        <form action="{{ action('AdminController@adminUpdate', $user->id) }}" method="post">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">ПІБ</label>
                                        <input required name="name" value="{{ $user->name }}" type="text"
                                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                               placeholder="ПІБ">

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Email</label>
                                        <input required type="email" name="email"
                                               class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}"
                                               id="email" readonly
                                               value="{{ $user->email }}" placeholder="name@example.com">

                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input id="password" type="password"
                                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                               name="password">

                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm">Підтвердження паролю</label>
                                        <input id="password-confirm" type="password"
                                               class="form-control {{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                               name="password_confirmation">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">Роль</label>
                                        <select name="type"
                                                class="form-control {{ $errors->has('type') ? ' is-invalid' : '' }}">
                                            <option @if($user->type == "admin") selected @endif value="admin">Адміністратор</option>
                                            <option @if($user->type == "moderator") selected @endif value="moderator">Вихователь групи</option>
                                        </select>

                                        @if ($errors->has('type'))
                                            <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('type') }}</strong>
                                                </span>
                                        @endif

                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary mb-2">Oновити</button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Адміністрація
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Iм'я</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Дії</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Iм'я</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Дії</th>
                        </tr>
                        </tfoot>
                        <tbody>

                        @foreach($users as $user)
                            <tr>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->type }}</td>

                                <td class="action-td">
                                    <a class="btn btn-warning"
                                       href="{{ action('AdminController@adminEdit', $user->id) }}">Редагувати</a>

                                    <form id="delete-form" method="POST" action="/admin/admins/delete/{{$user->id}}">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-danger" value="Вилучити">
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

@endsection

@section('scripts')

    <script src="{{ asset('administrator/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('administrator/js/dataTables.bootstrap4.js') }}"></script>

    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
@endsection
