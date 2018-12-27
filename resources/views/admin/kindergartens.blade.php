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

            <div class="col-md-4">

                <h3>Список Садиков</h3>

                <ul class="list-group">

                    @foreach($schools as $school)
                        <li class="list-group-item">{{ $school->name }}</li>
                    @endforeach

                </ul>
            </div>
            <div class="col-md-4">
                <h3>Создание Садика</h3>

                <form action="{{ action('SchoolController@adminStore') }}" method="post">
                    {{ csrf_field() }}

                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Название садика</label>
                        <input type="text" name="name" class="form-control" required placeholder="Название садика">
                    </div>

                    <button type="submit" class="btn btn-primary mb-2">Создать</button>
                </form>
            </div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Example multiple select</label>
                        <select multiple class="form-control" id="exampleFormControlSelect2">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>

    </div>

@endsection

@section('scripts')

@endsection
