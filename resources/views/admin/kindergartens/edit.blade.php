@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Главная страница</a>
            </li>
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/kindergartens') }}">Садики</a>
            </li>
            <li class="breadcrumb-item active">{{ $school->name }}</li>
        </ol>

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

            <div class="col-md-4">
                <h3>Список Садиков</h3>
                <ul class="list-group list-group-flex">

                    @foreach($schools as $school)
                        <li class="list-group-item">
                            <div>
                                <a class="orange-text"
                                   href="{{ action('SchoolController@adminEdit', $school->id) }}">
                                    {{ $school->name }}
                                </a>

                                <p class="group-count">Человек</p>
                            </div>


                            <form id="delete-form" method="POST" action="/admin/kindergartens/{{$school->id}}">
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

                <form action="{{ action('SchoolController@adminUpdate', $school->id) }}" method="post">
                    {{ csrf_field() }}
                    {{ method_field('PUT') }}


                    <div class="row">
                        <div class="col-md-6">
                            <h3>Редактирование Садика</h3>


                            <div class="form-group">
                                <label for="exampleFormControlSelect2">Название садика</label>
                                <input type="text" name="name" class="form-control" required
                                     value="{{ $school->name }}"  placeholder="Название садика">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Группы</label>

                                @foreach($groups as $group)

                                    <div class="form-check">
                                        <label class="container">
                                            {{ $group->name }}
                                            <input

                                                @foreach($school->groups as $school_group)
                                                @if($group->id == $school_group->id) checked @endif
                                                @endforeach

                                                value="{{ $group->id }}" name="group_id[]"
                                                type="checkbox">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>

                                @endforeach

                            </div>
                        </div>

                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary mb-2">Создать</button>
                        </div>

                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection
