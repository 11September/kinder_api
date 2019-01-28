@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Розклад</li>
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
                        Список груп
                    </div>

                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">
                        <h3>Cписок cадкiв</h3>

                        <div class="form-group">
                            <select required name="school_id"
                                    class="form-control choose_school {{ $errors->has('school_id') ? ' is-invalid' : '' }}">

                                @foreach($schools as $school)
                                    <option class="choose_school_option"
                                            value="{{ $school->id }}">{{ $school->name }}</option>
                                @endforeach

                            </select>
                        </div>

                        <h3>Cписок груп</h3>

                        <ul class="list-group list-group-flex" id="wrapper-list-groups">
                            @foreach($groups as $group)
                                <li class="list-group-item">
                                    <a class="orange-text" href="{{ action('SchedulesController@adminShow', $group->id) }}">{{ $group->name }}</a>
                                </li>
                            @endforeach
                        </ul>

                    </div>

                    <div class="col-md-10">
                        <div class="row">

                            {{--@foreach($schedules as $schools)--}}
                                {{--<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 wrapper-schedule-one-school">--}}

                                    {{--<h1>Розклад - {{ @$schools[0]->school->name }}</h1>--}}
                                    {{--<div class="row">--}}

                                        {{--@foreach($schools as $schedule)--}}
                                            {{--<div class="col-md-6">--}}
                                                {{--<div class="schedule-item">--}}
                                                    {{--<div class="schedule-item-day">--}}
                                                        {{--@if($schedule->day == "Monday")--}}
                                                            {{--Пн--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Tuesday")--}}
                                                            {{--Вт--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Wednesday")--}}
                                                            {{--Ср--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Thursday")--}}
                                                            {{--Чт--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Friday")--}}
                                                            {{--Пт--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Saturday")--}}
                                                            {{--Сб--}}
                                                        {{--@endif--}}

                                                        {{--@if($schedule->day == "Sunday")--}}
                                                            {{--Вс--}}
                                                        {{--@endif--}}
                                                    {{--</div>--}}

                                                    {{--<div class="row">--}}
                                                        {{--<div class="col-md-9 offset-md-3">--}}

                                                            {{--@foreach($schedule->lessons as $lesson)--}}
                                                                {{--<div class="schedule-list-day">--}}
                                                                    {{--<p class="schedule-list-day-time">{{ $lesson->from }}--}}
                                                                        {{--- {{ $lesson->to }}</p>--}}
                                                                    {{--<p class="schedule-list-day-name">{{ $lesson->name }}</p>--}}
                                                                {{--</div>--}}
                                                            {{--@endforeach--}}

                                                        {{--</div>--}}
                                                    {{--</div>--}}
                                                {{--</div>--}}
                                            {{--</div>--}}
                                        {{--@endforeach--}}

                                    {{--</div>--}}
                                {{--</div>--}}
                            {{--@endforeach--}}


                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            $('.choose_school').on('change', function () {
                var school_id = $(this).val();
                if (school_id) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },

                        type: 'POST',
                        url: '/admin/groups/getAllGroupsById',
                        dataType: 'json',
                        data: {id: school_id},
                        success: function (data) {

                            if (data.success) {
                                $('#wrapper-list-groups').empty();

                                if (data.data && data.data !== '') {
                                    $.each(data.data, function (index, item) {
                                        console.log(item);

                                        $('#wrapper-list-groups').append(
                                            '<li class="list-group-item">' +
                                            '<a class="orange-text" href="/admin/schedules/'+item.id+'">' + item.name + '</a>' +
                                            '</li>'
                                        );
                                    });
                                } else {
                                    console.log("empty data");
                                    $('#wrapper-list-groups').empty();
                                }
                            }

                        }, error: function () {
                            console.log(data);
                        }
                    });
                }
            });
        });
    </script>
@endsection
