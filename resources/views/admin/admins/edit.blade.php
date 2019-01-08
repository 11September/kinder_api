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
            <li class="breadcrumb-item active">Администрация</li>
        </ol>

        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Администрация
            </div>
            <div class="card-body">

                <div class="row">
                    <div class="col-md-4">
                        <div class="wrapper-admin-edit">
                            <form action="{{ action('AdminController@adminUpdate', $user->id) }}" method="post">
                                {{ csrf_field() }}
                                {{ method_field('PUT') }}

                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Полное Имя</label>
                                    <input required name="name" type="text" class="form-control"
                                          value="{{ $user->name }}" placeholder="name@example.com">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Роль</label>
                                    <select name="type" class="form-control">
                                        <option @if($user->type == "admin") selected @endif value="admin">Администратор</option>
                                        <option @if($user->type == "moderator") selected @endif value="moderator">Модератор</option>
                                        <option @if($user->type == "default") selected @endif value="default">Обычный пользователь</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-primary mb-2">Обновить</button>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Имя</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Действия</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Имя</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Действия</th>
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
                                       href="{{ action('AdminController@adminEdit', $user->id) }}">Редактировать</a>
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
