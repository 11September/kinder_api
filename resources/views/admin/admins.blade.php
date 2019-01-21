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
            <li class="breadcrumb-item active">Адміністрація</li>
        </ol>

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
                                    <a class="btn btn-warning" href="{{ action('StudentsController@adminEdit', $user->id) }}">Редагувати</a>

                                    <form id="delete-form" method="POST" action="/admin/users/{{$user->id}}">
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

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Створити адміністратора</h2>
                    </div>

                    <div class="card-body">

                        <form action="{{ url('admin/admins/store') }}" method="post">
                            {{ csrf_field() }}

                            <div class="form-group">
                                <label for="exampleFormControlInput1">ПІБ</label>
                                <input required name="name" value="{{ old('name') }}" type="text"
                                       class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}" placeholder="ПІБ дитини">

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlInput1">Email</label>
                                <input required type="email" name="email" class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}" id="email"
                                       value="{{ old('email') }}" placeholder="name@example.com">

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="password">Пароль</label>
                                <input id="password" type="password"
                                       class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                       name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="password-confirm">Підтвердження паролю</label>
                                <input id="password-confirm" type="password" class="form-control {{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                       name="password_confirmation" required>
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Роль</label>
                                <select name="type" class="form-control {{ $errors->has('type') ? ' is-invalid' : '' }}">
                                    <option value="admin">Адміністратор</option>
                                    <option value="moderator">Вихователь групи </option>
                                </select>

                                @if ($errors->has('type'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('type') }}</strong>
                                    </span>
                                @endif

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

    <script src="{{ asset('administrator/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('administrator/js/dataTables.bootstrap4.js') }}"></script>

    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>
@endsection
