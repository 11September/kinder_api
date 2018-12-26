@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ url('admin') }}">Главная страница</a>
            </li>
            <li class="breadcrumb-item active">Пользователи</li>
        </ol>

        <div class="card mb-3">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <i class="fas fa-table"></i>
                        Список Пользователей
                    </div>
                    <div class="col-md-6">
                        <a href="{{ action('StudentsController@adminCreate') }}">Создать Пользователя</a>
                    </div>
                </div>
            </div>


            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>№</th>
                            <th>ФИО ребенка</th>
                            <th>Номер родителя</th>
                            <th>Email</th>
                            <th>Садик</th>
                            <th>Группа</th>
                            <th>Статус</th>
                            <th>Действия</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>№</th>
                            <th>ФИО ребенка</th>
                            <th>Номер родителя</th>
                            <th>Email</th>
                            <th>Садик</th>
                            <th>Группа</th>
                            <th>Статус</th>
                            <th>Действия</th>
                        </tr>
                        </tfoot>
                        <tbody>

                        @foreach($users as $user)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->parent_phone }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->school_id }}</td>
                                <td>{{ $user->group_id }}</td>
                                <td>{{ $user->status }}</td>
                                <td>
                                    <a href="">Crud</a>
                                    <a href="">Crud</a>
                                    <a href="">Crud</a>
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
