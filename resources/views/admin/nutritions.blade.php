@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Розклад харчування </li>
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
                    <div class="col-md-3">
                        <h3>Cписок cадкiв</h3>

                        <ul class="list-group list-group-flex">

                            @foreach($list_schools as $school)
                                <li class="list-group-item">
                                    <div>
                                        <a class="orange-text"
                                           href="{{ action('NutritionsController@adminShow', $school->id) }}">
                                            {{ $school->name }}
                                        </a>
                                    </div>
                                </li>
                            @endforeach

                        </ul>
                    </div>

                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Вибрати день тижня</h4>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Понеділок
                                        <input value="Monday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Вівторок
                                        <input value="Tuesday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Середа
                                        <input value="Wednesday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Четвер
                                        <input value="Thursday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        П'ятниця
                                        <input value="Friday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Субота
                                        <input value="Saturday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Неділя
                                        <input value="Sunday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <label class="container-checkbox">
                                        Усі дні
                                        <input checked value="Sunday" type="radio" name="day">
                                        <span class="checkmark-radio"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-8">

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection
