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
            <li class="breadcrumb-item active">Группы</li>
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

                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <h3>Список Груп</h3>

                        <ul class="list-group list-group-flex">

                            @foreach($groups as $group)
                                <li class="list-group-item">
                                    <div>
                                        <a class="orange-text"
                                           href="{{ action('GroupController@adminEdit', $group->id) }}">
                                            {{ $group->name }}
                                        </a>

                                        <p class="group-count">{{ $group->students_count }} Человек</p>
                                    </div>


                                    <form id="delete-form" method="POST" action="/admin/groups/{{$group->id}}">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-danger" value="&#10008">
                                        </div>
                                    </form>
                                </li>
                            @endforeach

                        </ul>
                    </div>

                    <div class="col-md-8">
                        <h3 style="text-align: center">Создать группу</h3>

                        <form action="{{ action('GroupController@adminStore') }}" method="post">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Садик</label>

                                        @foreach($schools as $school)

                                            <div class="form-check">
                                                <label class="container-checkbox">
                                                    {{ $school->name }}
                                                    <input required value="{{ $school->id }}" type="radio"
                                                           name="school_id">
                                                    <span class="checkmark-radio"></span>
                                                </label>
                                            </div>

                                        @endforeach

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Название Группы</label>
                                        <input required type="text" name="name" class="form-control" id="name"
                                               placeholder="Название Группы">
                                    </div>

                                    <div class="form-group">
                                        <label for="user_id">Выбрать администратора</label>
                                        <select required name="user_id" class="form-control" id="user_id">

                                            @foreach($users as $administrator)
                                                <option
                                                    value="{{ $administrator->id }}">{{ $administrator->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary mb-2">Создать</button>
                                </div>
                            </div>
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
