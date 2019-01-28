@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/toastr.min.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>

            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/schedules') }}">Розклад</a>
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

                    @include('admin.partials.errors')

                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">


                        <h3>Cписок cадкiв</h3>

                        <div class="form-group">
                            <select required name="school_id"
                                    class="form-control choose_school {{ $errors->has('school_id') ? ' is-invalid' : '' }}">

                                @foreach($list_schools as $school)
                                    <option class="choose_school_option"
                                            value="{{ $school->id }}">{{ $school->name }}</option>
                                @endforeach

                            </select>
                        </div>



                        <h3>Cписок груп</h3>

                        <ul class="list-group list-group-flex" id="wrapper-list-groups">

                            @foreach($groups as $group)
                                <li class="list-group-item @if($group->id == $current_school->id) active @endif">
                                    <div>
                                        <a class="orange-text"
                                           href="{{ action('SchedulesController@adminShow', $group->id) }}">
                                            {{ $group->name }}
                                        </a>
                                    </div>

                                    <div class="list-group-flex-wrapper-notification">
                                        <a class="notification-school" data-id="{{ $group->id }}" href="#">
                                            <p class="list-group-flex-notification"><i class="fas fa-bell"></i></p>
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

                                <div class="all-days-checkboxes">
                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Понеділок
                                            <input value="Monday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Вівторок
                                            <input value="Tuesday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Середа
                                            <input value="Wednesday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Четвер
                                            <input value="Thursday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            П'ятниця
                                            <input value="Friday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Субота
                                            <input value="Saturday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Неділя
                                            <input value="Sunday" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>

                                    <div class="form-check">
                                        <label class="container-checkbox">
                                            Усі дні
                                            <input checked value="all" type="radio" name="day">
                                            <input class="hidden-school" hidden value="{{ $current_school->id }}"
                                                   type="text" name="school_id">
                                            <span class="checkmark-radio"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">

                                <div class="wrapper-schedule row">

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

@endsection

@section('scripts')
    <script src="{{ asset('administrator/js/toastr.min.js') }}"></script>

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



            var global_school_id;
            var global_day;

            $('.all-days-checkboxes input').on('change', function () {
                var day = $('input[name=day]:checked', '.all-days-checkboxes').val();
                var school_id = $(this).siblings(".hidden-school").val();

                global_day = day;
                global_school_id = school_id;

                // if all
                if (day == "all") {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/adminGetLessonsAll',
                        dataType: 'json',
                        data: {school_id: school_id},
                        success: function (data) {

                            if (data.success) {
                                var content = $('.wrapper-schedule').css('padding', '0').empty();
                                JSON.stringify(data.data);

                                var itemContent = "";
                                $.each(data.data, function (index, item) {
                                    var day_name;
                                    if (item.day == "Monday") {
                                        day_name = "Пн"
                                    }
                                    if (item.day == "Tuesday") {
                                        day_name = "Вт"
                                    }
                                    if (item.day == "Wednesday") {
                                        day_name = "Ср"
                                    }
                                    if (item.day == "Thursday") {
                                        day_name = "Чт"
                                    }
                                    if (item.day == "Friday") {
                                        day_name = "Пт"
                                    }
                                    if (item.day == "Saturday") {
                                        day_name = "Сб"
                                    }
                                    if (item.day == "Sunday") {
                                        day_name = "Вс"
                                    }

                                    itemContent = "";
                                    var itemContentLoop = "";

                                    $.each(item.lessons, function (i, item) {

                                        console.log(item);

                                        itemContentLoop += '<div class="schedule-list-day">' +
                                            '<p class="schedule-list-day-time">' +
                                            item.from + " - " + item.to +
                                            '</p>' +
                                            '<p class="schedule-list-day-name">' +
                                            item.name +
                                            '</p>' +
                                            '</div>';
                                    });


                                    itemContent = '<div class="col-md-6">' +
                                        '<div class="schedule-item">' +
                                        '<div class="schedule-item-day">' +
                                        day_name +
                                        '</div>' +
                                        '<div class="row">' +
                                        '<div class="col-md-3"></div>' +
                                        '<div class="col-md-9">' +
                                        itemContentLoop +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';

                                    content.append(itemContent);
                                    itemContentLoop = "";
                                    itemContent = "";

                                });
                            }

                        }, error: function () {
                            console.log(data);
                        }
                    });
                } else {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/adminGetLessonsByDay',
                        dataType: 'json',
                        data: {school_id: school_id, day: day},
                        success: function (data) {

                            if (data.success && data.data) {
                                var content = $('.wrapper-schedule').css('padding', '0 20%').empty();

                                var day_name;
                                var schedule_id = data.data.id;

                                if (data.data.day == "Monday") {
                                    day_name = "Понеділок"
                                }
                                if (data.data.day == "Tuesday") {
                                    day_name = "Вівторок"
                                }
                                if (data.data.day == "Wednesday") {
                                    day_name = "Середа"
                                }
                                if (data.data.day == "Thursday") {
                                    day_name = "Четвер"
                                }
                                if (data.data.day == "Friday") {
                                    day_name = "П'ятниця"
                                }
                                if (data.data.day == "Saturday") {
                                    day_name = "Субота"
                                }
                                if (data.data.day == "Sunday") {
                                    day_name = "Неділя"
                                }

                                content.append(
                                    '<div class="row nomr">' +
                                    '<div class="col-md-12">' +
                                    '<p class="append-day-name">' + day_name + '</p>' +
                                    '</div>' +
                                    '</div>'
                                );


                                $.each(data, function (index, item) {
                                    console.log(item);

                                    $.each(item.lessons, function (i, item) {
                                        content.append('' +
                                            '<form method="post" class="newLessonForm">' +
                                            '<div class="row append-day-item append-day-item-border">\n' +
                                            '    <div class="col-md-9 padb-20">\n' +
                                            '         <input required type="text" name="name" class="form-control" placeholder="" value="' + item.name + '">\n' +
                                            '         <input type="text" hidden name="schedule_id" class="form-control" placeholder="" value="' + item.schedule_id + '">\n' +
                                            '         <input type="text" hidden name="lesson_id" class="form-control" placeholder="" value="' + item.id + '">\n' +
                                            '    </div>\n' +
                                            '    <div class="col-md-3 padb-20 control-lessons-buttons">' +
                                            '         <input type="text" hidden name="day" value="' + global_day + '">' +
                                            '         <input type="text" hidden name="school_id" value="' + global_school_id + '">' +
                                            '         <button class="newLessonFormButton" type="submit">' +
                                            '              <i class="far fa-save"></i>' +
                                            '         </button>' +
                                            '         <a class="delete-lesson" data-id="' + item.id + '" href="#"><i class="fas fa-trash-alt"></i></a>' +
                                            '    </div>' +
                                            '    <div class="col-md-6">\n' +
                                            '    <span>Время с</span>' +
                                            '        <input type="time" name="from" class="form-control" placeholder="" value="' + item.from + '">\n' +
                                            '    </div>\n' +
                                            '    <div class="col-md-6">\n' +
                                            '    <span>Время до</span>' +
                                            '        <input type="time" name="to" class="form-control" placeholder="" value="' + item.to + '">\n' +
                                            '    </div>\n' +
                                            '</div>' +
                                            '</form>'
                                        );

                                        // '             <a class="save-lesson" data-day="' + global_day + '" data-school="' + global_school_id + '" data-id="" href="#"><i class="far fa-save"></i></a>' +

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
                            if (data.success && !data.data) {
                                var content = $('.wrapper-schedule').css('padding', '0 20%').empty();

                                if (global_day == "Monday") {
                                    day_name = "Понеділок"
                                }
                                if (global_day == "Tuesday") {
                                    day_name = "Вівторок"
                                }
                                if (global_day == "Wednesday") {
                                    day_name = "Середа"
                                }
                                if (global_day == "Thursday") {
                                    day_name = "Четвер"
                                }
                                if (global_day == "Friday") {
                                    day_name = "П'ятниця"
                                }
                                if (global_day == "Saturday") {
                                    day_name = "Субота"
                                }
                                if (global_day == "Sunday") {
                                    day_name = "Неділя"
                                }

                                content.append(
                                    '<div class="row nomr">' +
                                    '<div class="col-md-12">' +
                                    '<p class="append-day-name">' + day_name + '</p>' +
                                    '</div>' +
                                    '</div>'
                                );

                                content.append(
                                    '<div class="row append-day-item">' +
                                    '<div class="col-md-12">' +
                                    '<div class="add-more-lesson">' +
                                    '<p>Додати подію</p>' +
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
                }
            });

            $(".wrapper-schedule").on("click", '.delete-lesson', function (e) {
                // $(document).on('click','.delete-lesson',function(e) {
                e.preventDefault();

                var clicked = $(e.target);
                clicked.prop('disabled', true);
                var delete_lesson_id = $(this).attr("data-id");

                if (delete_lesson_id) {
                    $.ajax({
                        type: 'GET',
                        url: '/admin/adminDeleteLessonsByDay',
                        dataType: 'json',
                        data: {id: delete_lesson_id},
                        success: function (data) {

                            if (data.success) {
                                clicked.closest('div.append-day-item').fadeOut(300, function () {
                                    $(this).remove();
                                });
                                toastr.success('Розклад успішно оновлено!', {timeOut: 3000});
                            }

                            console.log(data);
                        }, error: function () {
                            console.log(data);
                        }
                    });
                } else {
                    clicked.closest('div.append-day-item').fadeOut(300, function () {
                        $(this).remove();
                    });
                }

                clicked.prop('disabled', false);
            });

            $(".wrapper-schedule").on("click", '.more-lesson', function (e) {
                // $(document).on('click','.delete-lesson',function(e) {
                e.preventDefault();

                var clicked = $(e.target);
                clicked.prop('disabled', true);
                console.log("click more-lesson");

                clicked.closest('div.append-day-item').addClass('lol').before('' +
                    '<form method="post" class="newLessonForm">' +
                    '<div class="row append-day-item append-day-item-border">\n' +
                    '    <div class="col-md-9 padb-20">\n' +
                    '         <input required type="text" name="name" class="form-control" placeholder="" value="">\n' +
                    '         <input type="text" hidden name="schedule_id" class="form-control" placeholder="" value="">\n' +
                    '    </div>\n' +
                    '    <div class="col-md-3 padb-20 control-lessons-buttons">' +
                    '         <input type="text" hidden name="day" value="' + global_day + '">' +
                    '         <input type="text" hidden name="school_id" value="' + global_school_id + '">' +
                    '         <input type="text" class="lesson_id" hidden name="lesson_id" value="">' +
                    '         <button class="newLessonFormButton" type="submit">' +
                    '             <i class="far fa-save"></i>' +
                    '         </button>' +
                    '         <a class="delete-lesson" data-id="" href="#"><i class="fas fa-trash-alt"></i></a>' +
                    '    </div>' +
                    '    <div class="col-md-6">\n' +
                    '    <span>Время с</span>' +
                    '        <input required type="time" name="from" class="form-control" placeholder="" value="">\n' +
                    '    </div>\n' +
                    '    <div class="col-md-6">\n' +
                    '    <span>Время до</span>' +
                    '        <input required type="time" name="to" class="form-control" placeholder="" value="">\n' +
                    '    </div>\n' +
                    '</div>' +
                    '</form>'
                ).hide().fadeIn();

                clicked.prop('disabled', false);

            });

            $(".wrapper-schedule").on("submit", '.newLessonForm', function (e) {
                e.preventDefault();

                console.log("click save-lesson");

                var clicked = $(e.target);
                clicked.prop('disabled', true);

                var serializeData = clicked.closest('form.newLessonForm').serialize();
                var _token = $('meta[name=csrf-token]').attr('content');

                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },

                    type: 'POST',
                    url: '/admin/adminSaveLessonsByDay',
                    dataType: 'json',
                    data: serializeData,
                    success: function (data) {

                        if (data.success) {
                            $(e.target).find('.lesson_id').attr('value', data.id);
                            $(e.target).find('.delete-lesson').attr("data-id", data.id);
                            $(e.target).find('.append-day-item').css('border', '2px solid #de6a1c');
                            toastr.success('Розклад успішно оновлено!', {timeOut: 3000});
                        }

                        console.log(data);
                    }, error: function () {
                        console.log(data);
                    }
                });

                clicked.prop('disabled', false);
            });

            $(".card-body").on("click", '.notification-school', function (e) {
                e.preventDefault();

                var clicked = $(e.target);
                var notification_school_id = $(this).attr("data-id");
                clicked.prop('disabled', true);

                toastr.warning("<br/><div class='wrapper-confirmationRevertYes'><button type='button' class='btn clear confirmationRevertYes'>Отправить</button></div>",'Дійсно відправити користувачам повідомлення зі зміною розкладу?',
                    {
                        closeButton: true,
                        timeOut : 3000,
                        extendedTimeOut : 6000,
                        allowHtml: true,
                        onShown: function (toast) {
                            $(".confirmationRevertYes").click(function(){
                                $.ajax({
                                    headers: {
                                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                    },

                                    type: 'POST',
                                    url: '/admin/notifications/notifyScheduleBySchool',
                                    dataType: 'json',
                                    data: {id: notification_school_id},
                                    success: function (data) {
                                        if (data.success) {
                                            toastr.success('Повідомлення успішно відправлено!', {timeOut: 3000});
                                        }

                                        if (data.error) {
                                            toastr.error('Вибачте виникла помилка!', {timeOut: 3000});
                                        }
                                    }, error: function () {
                                        console.log(data);
                                    }
                                });
                            });
                        }
                    });

                clicked.prop('disabled', false);
            });

        });
    </script>
@endsection
