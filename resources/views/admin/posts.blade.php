@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="#">Главная страница</a>
            </li>
            <li class="breadcrumb-item active">Новости</li>
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

                    <div class="col-md-6">
                        <i class="fas fa-table"></i>
                        Новости
                    </div>

                    <div class="col-md-6">
                        <a href="{{ action('PostsController@adminCreate') }}">Создать Новость</a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Название</th>
                            <th>Картинка</th>
                            <th>Вдемя до</th>
                            <th>Садик</th>
                            <th>Действия</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Название</th>
                            <th>Картинка</th>
                            <th>Вдемя до</th>
                            <th>Садик</th>
                            <th>Действия</th>
                        </tr>
                        </tfoot>
                        <tbody>

                        @foreach($posts as $post)
                            <tr>
                                <td>{{ $post->title }}</td>
                                <td><img class="post-image" src="{{ asset($post->preview) }}" alt=""></td>
                                <td>{{ $post->until }}</td>
                                <td>{{ $post->until }}</td>
                                <td>
                                    <a href="{{ action('PostsController@adminEdit', $post->id) }}">Редактировать</a>

                                    <form id="delete-form" method="POST" action="/admin/posts/{{$post->id}}">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-danger" value="Удалить Пост">
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
