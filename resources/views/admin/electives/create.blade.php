@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Tables</li>
        </ol>


        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Создать админа</h2>
                    </div>

                    <div class="card-body">

                        <form action="{{ url('admin/admins/store') }}" method="post">
                            {{ csrf_field() }}

                            <div class="form-group">
                                <label for="exampleFormControlInput1">Полное Имя</label>
                                <input required name="name" type="text" class="form-control"
                                       placeholder="name@example.com">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Email</label>
                                <input required name="email" type="email" class="form-control"
                                       placeholder="name@example.com">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Роль</label>
                                <select name="type" class="form-control">
                                    <option value="admin">Admin</option>
                                    <option value="moderator">Moderator</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Create</button>
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
