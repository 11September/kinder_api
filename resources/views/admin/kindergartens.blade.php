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
            <li class="breadcrumb-item active">Садики</li>
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

            @include('admin.partials.errors')

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

                                <p class="group-count">Кол-во групп : {{ $school->groups_count }}</p>
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

                <form action="{{ action('SchoolController@adminStore') }}" method="post">
                    {{ csrf_field() }}

                    <div class="row">
                        <div class="col-md-6">
                            <h3>Создание Садика</h3>


                            <div class="form-group">
                                <label for="exampleFormControlSelect2">Название садика</label>
                                <input type="text" name="name" class="form-control" required
                                      value="{{ old('name') }}" placeholder="Название садика">
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Создать</button>

                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Группы</label>

                                @foreach($groups as $group)

                                    <div class="form-check">
                                        <label class="container">
                                            {{ $group->name }}
                                            <input value="{{ $group->id }}" name="group_id[]" type="checkbox"
                                                   class="{{ $errors->has('group_id') ? ' is-invalid' : '' }}">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>

                                @endforeach

                                @if ($errors->has('group_id'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('group_id') }}</strong>
                                    </span>
                                @endif

                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection
