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

            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/schedules') }}">Рассписание</a>
            </li>

            <li class="breadcrumb-item active">{{ $current_school->name }}</li>
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
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <h3>Список Садиков</h3>

                        <ul class="list-group list-group-flex">

                            @foreach($list_schools as $school)
                                <li class="list-group-item @if($school->id == $current_school->id) active @endif">
                                    <div>
                                        <a class="orange-text"
                                           href="{{ action('SchedulesController@adminShow', $school->id) }}">
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
                                <h4>Выбрать день недели</h4>

                                <div class="all-days-checkboxes">
                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Понедельник
                                            <input value="Monday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Вторник
                                            <input value="Tuesday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Среда
                                            <input value="Wednesday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Четверг
                                            <input value="Thursday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Пятница
                                            <input value="Friday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Суббота
                                            <input value="Saturday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Воскресенье
                                            <input value="Sunday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Все дни
                                            <input checked value="all" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">

                                <div class="wrapper-schedule">
                                    <div class="row">

                                        @foreach($schedules as $schedule)
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

                                                            @foreach($schedule->lessons as $lesson)
                                                                <div class="schedule-list-day">
                                                                    <p class="schedule-list-day-time">{{ $lesson->from }}
                                                                        - {{ $lesson->to }}</p>
                                                                    <p class="schedule-list-day-name">{{ $lesson->name }}</p>
                                                                </div>
                                                            @endforeach

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach

                                    </div>
                                </div>
                            </div>
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

            $('.all-days-checkboxes input').on('change', function () {
                var day = $('input[name=day]:checked', '.all-days-checkboxes').val();
                var school_id = $(this).siblings(".hidden-school").val();
                alert(school_id);
                alert(day);

                // if all

                $.ajax({
                    type: 'GET',
                    url: '/admin/adminGetLessonsByDay',
                    dataType: 'json',
                    data: {school_id: school_id, day: day},
                    success: function (data) {

                        if (data.success) {
                            var content = $('.wrapper-schedule').css('padding', '0 20%').empty();

                            var day_name;
                            if(data.data.day == "Monday"){day_name = "Понедельник"}
                            if(data.data.day == "Tuesday"){day_name = "Вторник"}
                            if(data.data.day == "Wednesday"){day_name = "Среда"}
                            if(data.data.day == "Thursday"){day_name = "Четверг"}
                            if(data.data.day == "Friday"){day_name = "Пятница"}
                            if(data.data.day == "Saturday"){day_name = "Суббота"}
                            if(data.data.day == "Sunday"){day_name = "Воскресенье"}

                            content.append(
                                '<div class="row nomr">' +
                                '<div class="col-md-12">' +
                                '<p class="append-day-name">'+day_name+'</p>' +
                                '</div>' +
                                '</div>'
                            );


                            $.each(data, function (index, item) {
                                console.log(item);

                                $.each(item.lessons, function (i, item) {
                                    content.append('' +
                                        '<div class="row append-day-item append-day-item-border">\n' +
                                        '    <div class="col-md-10 padb-20">\n' +
                                        '         <input type="text" name="name[]" class="form-control" placeholder="" value="'+item.name+'">\n' +
                                        '         <input type="text" hidden name="schedule_id[]" class="form-control" placeholder="" value="'+item.schedule_id+'">\n' +
                                        '    </div>\n' +
                                        '    <div class="col-md-2 padb-20"><a class="delete-lesson" data-id="'+item.id+'" href="#"><i class="fas fa-trash-alt"></i></a></div>' +
                                        '    <div class="col-md-6">\n' +
                                        '    <span>Время с</span>' +
                                        '        <input type="time" name="from[]" class="form-control" placeholder="" value="'+item.from+'">\n' +
                                        '    </div>\n' +
                                        '    <div class="col-md-6">\n' +
                                        '    <span>Время до</span>' +
                                        '        <input type="time" name="to[]" class="form-control" placeholder="" value="'+item.to+'">\n' +
                                        '    </div>\n' +
                                        '</div>');


                                    console.log("sub each");
                                    console.log(item);
                                });
                            });

                            content.append(
                                '<div class="row append-day-item">' +
                                '<div class="col-md-12">' +
                                '<div class="add-more-lesson">' +
                                '<p>Добавить событие</p>' +
                                '<p><a class="more-lesson" href="#"><i class="fas fa-plus"></i></a></p>' +
                                '</div>' +
                                '</div>' +
                                '</div>'
                            );
                        }


                        console.log(data);
                    }, error: function () {
                        console.log(data);
                    }
                });
            });

            $(document).on('click','.delete-lesson',function(e) {
                e.preventDefault();
                var delete_lesson_id = $(this).attr("data-id");
                alert( delete_lesson_id );

                if (delete_lesson_id){
                    alert('ajax');
                }
            });


        });
    </script>
@endsection
