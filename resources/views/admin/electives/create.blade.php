@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Главная Страница</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/electives') }}">Кружки</a>
            </li>
            <li class="breadcrumb-item active">Создание кружка</li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Создание Кружка</h2>
                    </div>

                    <div class="card-body">

                        @include('admin.partials.errors')

                        <form action="{{ action('ElectivesContoller@adminStore') }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-row">


                                        <div class="form-group col-md-12">
                                            <label for="exampleFormControlInput1">Название кружка</label>
                                            <input required name="name" value="{{ old('name') }}" type="text"
                                                   class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                                   placeholder="Название">

                                            @if ($errors->has('name'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="exampleFormControlInput1">Время С</label>
                                            <input required name="time_start" value="{{ old('time_start') }}" type="time"
                                                   class="form-control {{ $errors->has('time_start') ? ' is-invalid' : '' }}"
                                                   placeholder="Название">

                                            @if ($errors->has('until'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('time_start') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="exampleFormControlInput1">Время До</label>
                                            <input required name="time_end" value="{{ old('time_end') }}" type="time"
                                                   class="form-control {{ $errors->has('time_end') ? ' is-invalid' : '' }}"
                                                   placeholder="Название">

                                            @if ($errors->has('time_end'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('time_end') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Садик</label>

                                            @foreach($schools as $school)

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        {{ $school->name }}
                                                        <input required value="{{ $school->id }}" type="radio"
                                                               checked="checked" name="school_id">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                            @endforeach

                                            @if ($errors->has('school_id'))
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $errors->first('school_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Группы</label>

                                            @foreach($groups as $group)

                                                <div class="form-check">
                                                    <label class="container">
                                                        {{ $group->name }}
                                                        <input value="{{ $group->id }}" name="group_id[]" type="checkbox">
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>

                                            @endforeach

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Создать</button>

                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')

@endsection
