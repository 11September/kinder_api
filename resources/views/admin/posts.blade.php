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
            <li class="breadcrumb-item active">Новини</li>
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

                    <div class="col-md-6">
                        <i class="fas fa-table"></i>
                        Новости
                    </div>

                    <div class="col-md-6">
                        <div class="flex-end">
                            <a class="orange-link" href="{{ action('PostsController@adminCreate') }}">Створення новини</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" data-order='[[ 0, "desc" ]]'>
                        <thead>
                        <tr>
                            <th>Назва</th>
                            <th>Картинка</th>
                            <th>Час до</th>
                            <th>Садок</th>
                            <th>Дії</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Назва</th>
                            <th>Картинка</th>
                            <th>Час до</th>
                            <th>Садок</th>
                            <th>Дії</th>
                        </tr>
                        </tfoot>
                        <tbody>

                        @foreach($posts as $post)
                            <tr>
                                <td>{{ $post->title }}</td>
                                <td><img class="post-image" src="{{ asset("storage/" . $post->preview) }}" alt=""></td>
                                <td>{{ $post->until }}</td>
                                <td><a class="orange-text" href="{{ action('SchoolController@adminEdit', @$post->school->id) }}">{{ @$post->school->name }}</a></td>
                                <td class="action-td">
                                    <a class="btn btn-warning" href="{{ action('PostsController@adminEdit', $post->id) }}">Редагувати</a>

                                    <form id="delete-form" method="POST" action="/admin/posts/{{$post->id}}">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-danger" value="Видалити пост">
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
            $('#dataTable').DataTable({
                "language": {
                    "sProcessing":   "Зачекайте...",
                    "sLengthMenu":   "Показати _MENU_ записів",
                    "sZeroRecords":  "Записи відсутні.",
                    "sInfo":         "Записи з _START_ по _END_ із _TOTAL_ записів",
                    "sInfoEmpty":    "Записи з 0 по 0 із 0 записів",
                    "sInfoFiltered": "(відфільтровано з _MAX_ записів)",
                    "sInfoPostFix":  "",
                    "sSearch":       "Пошук:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst": "Перша",
                        "sPrevious": "Попередня",
                        "sNext": "Наступна",
                        "sLast": "Остання"
                    },
                    "oAria": {
                        "sSortAscending":  ": активувати для сортування стовпців за зростанням",
                        "sSortDescending": ": активувати для сортування стовпців за спаданням"
                    }
                }
            });
        });
    </script>
@endsection
