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

                            @foreach($schedules as $schools)
                                <div class="col-md-6 wrapper-schedule-one-school">

                                    <h1>Розклад - {{ @$schools[0]->school->name }}</h1>
                                    <div class="row">

                                        @foreach($schools as $schedule)
                                            <div class="col-md-6">
                                                <div class="schedule-item">
                                                    <div class="schedule-item-day">
                                                        @if($schedule->day == "Monday")
                                                            Пн
                                                        @endif

                                                        @if($schedule->day == "Tuesday")
                                                            Вт
                                                        @endif

                                                        @if($schedule->day == "Wednesday")
                                                            Ср
                                                        @endif

                                                        @if($schedule->day == "Thursday")
                                                            Чт
                                                        @endif

                                                        @if($schedule->day == "Friday")
                                                            Пт
                                                        @endif

                                                        @if($schedule->day == "Saturday")
                                                            Сб
                                                        @endif

                                                        @if($schedule->day == "Sunday")
                                                            Вс
                                                        @endif
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3"></div>
                                                        <div class="col-md-9">

                                                            <div class="schedule-list-day">
                                                                <p class="schedule-list-day-time">
                                                                    Cніданок
                                                                </p>

                                                                @foreach($schedule->foods as $food)
                                                                    @if($food->type == "breakfast" )
                                                                        <p class="schedule-list-day-name">{{ $food->name }}</p>
                                                                    @endif
                                                                @endforeach
                                                            </div>

                                                            <div class="schedule-list-day">
                                                                <p class="schedule-list-day-time">
                                                                    Обід
                                                                </p>

                                                                @foreach($schedule->foods as $food)
                                                                    @if($food->type == "lunch" )
                                                                        <p class="schedule-list-day-name">{{ $food->name }}</p>
                                                                    @endif
                                                                @endforeach
                                                            </div>

                                                            <div class="schedule-list-day">
                                                                <p class="schedule-list-day-time">
                                                                    Полудень
                                                                </p>

                                                                @foreach($schedule->foods as $food)
                                                                    @if($food->type == "afternoon-tea" )
                                                                        <p class="schedule-list-day-name">{{ $food->name }}</p>
                                                                    @endif
                                                                @endforeach
                                                            </div>

                                                            <div class="schedule-list-day">
                                                                <p class="schedule-list-day-time">
                                                                    Вечеря
                                                                </p>

                                                                @foreach($schedule->foods as $food)
                                                                    @if($food->type == "dinner" )
                                                                        <p class="schedule-list-day-name">{{ $food->name }}</p>
                                                                    @endif
                                                                @endforeach
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach

                                    </div>
                                </div>
                            @endforeach


                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection
