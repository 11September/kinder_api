@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/jquery-confirm.min.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/groups') }}">Групи</a>
            </li>
            <li class="breadcrumb-item active">
                {{ $group->name }}
            </li>
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
                    <div class="col-md-6">
                        <div class="flex-end">
                            <a class="orange-link" href="{{ action('GroupController@adminIndex') }}">Створити групу</a>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card-body">
                <div class="row groups-page-reverse">
                    <div class="col-xl-4 col-lg-6 col-md-6">
                        <h3>Список груп</h3>

                        <ul class="list-group list-group-flex">

                            @foreach($groups as $list_groups)
                                <li class="list-group-item @if($list_groups->id == $group->id) active @endif">
                                    <div>
                                        <a class="orange-text"
                                           href="{{ action('GroupController@adminEdit', $list_groups->id) }}">
                                            {{ $list_groups->name }}
                                        </a>

                                        @php $count = 0 @endphp
                                        @foreach($list_groups->students as $student)
                                            @if($student->type == "default")
                                                @php $count++ @endphp
                                            @endif
                                        @endforeach

                                        <p class="group-count reference_link_wrapper">
                                            <a class="reference_link"
                                               href="{{ action('SchoolController@adminEdit', $group->school->id) }}">
                                                <i class="fas fa-hotel"></i>
                                                {{ $list_groups->school->name }}
                                            </a>

                                        </p>
                                        <p class="group-count">{{ $count }} чоловiк</p>
                                    </div>

                                    <div class="wrapper-school-delete">
                                        <form id="delete-form" method="POST" action="/admin/groups/{{$group->id}}">
                                            {{ csrf_field() }}
                                            {{ method_field('DELETE') }}

                                            <div class="form-group">
                                                <input type="submit" class="btn btn-danger del-group" value="&#10008">
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            @endforeach

                        </ul>
                    </div>

                    <div class="col-xl-8 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-xl-6">
                                <h3 style="text-align: center">Оновити групу</h3>

                                <form action="{{ action('GroupController@adminUpdate', $group->id) }}" method="post">
                                    {{ csrf_field() }}
                                    {{ method_field('PUT') }}

                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12 col-md-12">
                                            <div class="form-group">
                                                <label for="user_id">Вибрати садок</label>

                                                <select required name="school_id"
                                                        class="form-control {{ $errors->has('school_id') ? ' is-invalid' : '' }}"
                                                        id="school_id">

                                                    @foreach($schools as $school)
                                                        <option value="{{ $school->id }}"
                                                                @if($school->id == $group->school_id)
                                                                selected
                                                            @endif
                                                            {{ old("school_id") == $school->id ? "selected":"" }}>
                                                            {{ $school->name }}
                                                        </option>
                                                    @endforeach

                                                </select>
                                            </div>


                                            <div class="form-group">
                                                <label for="name">Назва групи</label>
                                                <input required type="text" value="{{ $group->name }}" name="name" id="name"
                                                       class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                                       placeholder="Название Группы">

                                                @if ($errors->has('name'))
                                                    <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                                @endif
                                            </div>

                                            <div class="form-group">
                                                <label for="user_id">Вибрати адміністратора</label>
                                                <select required name="user_id"
                                                        class="form-control {{ $errors->has('user_id') ? ' is-invalid' : '' }}"
                                                        id="user_id">

                                                    @foreach($admins as $administrator)
                                                        <option @if($administrator->id == @$group->user_id) selected @endif
                                                        value="{{ $administrator->id }}">{{ $administrator->name }}</option>
                                                    @endforeach

                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="moderator_id">Вибрати вихователя</label>

                                                @foreach($moderators as $moderator)
                                                    <div class="form-check">
                                                        <label class="container">
                                                            {{ $moderator->name }}
                                                            <input value="{{ $moderator->id }}" class="school_id"
                                                                   name="moderator_id[]" id="moderator_id"
                                                                   @if($moderator->group_id == $group->id)
                                                                   checked="checked"
                                                                   @endif
                                                                   type="checkbox">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                @endforeach

                                                @if(!$moderators || count($moderators) == 0)
                                                    <p>На жаль немає вільних вихователів. Створіть
                                                        <a class="orange-link" href="{{ url('/admin/admins') }}">нового</a>
                                                        вихователя.
                                                    </p>
                                                @endif
                                            </div>

                                            <button type="submit" class="btn btn-primary mb-2">Оновити</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-xl-6">
                                <h3 style="text-align: center">Список учнiв</h3>
                                <div class="list-group wrapper-group-users">
                                    @foreach($group->students as $student)
                                        @if($student->type != "moderator" && $student->status == "active")
                                            <a href="{{ action('StudentsController@adminEdit', $student->id) }}" class="list-group-item list-group-item-action">
                                                <p class="orange-text">{{ $student->name }}</p>
                                                <p>{{ $student->parent_name }}</p>
                                            </a>
                                        @endif
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
    <script src="{{ asset('administrator/js/jquery-confirm.min.js') }}"></script>

    <script>
        $(document).ready(function () {
            $('.del-group').click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var clicked = $(e.target);

                $.confirm({
                    // useBootstrap: false,
                    title: 'Видалення групи',
                    content: 'Підтвердіть видалення групи',
                    icon: 'fa fa-question-circle',
                    animation: 'scale',
                    closeAnimation: 'scale',
                    opacity: 0.5,
                    buttons: {
                        'confirm': {
                            text: 'Видалити',
                            btnClass: 'btn-red',
                            action: function () {
                                $.confirm({
                                    title: 'Підтвердіть видалення групи',
                                    content: 'Попередження: при видаленні групи видаляться: розклад зайнять, користувачі. Вихователі будуть відв\'язані від групи, новини будуть відв\'язані від групи!',
                                    icon: 'fa fa-warning',
                                    animation: 'scale',
                                    closeAnimation: 'zoom',
                                    buttons: {
                                        confirm: {
                                            text: 'Так, видалити!',
                                            btnClass: 'btn-red',
                                            action: function () {
                                                clicked.parent().parent().submit();
                                            }
                                        },
                                        cancel: {
                                            text: 'Скасувати',
                                            btnClass: 'btn-blue',
                                            action: function () {
                                                // $.alert('you clicked on <strong>cancel</strong>');
                                            }
                                        }
                                    }
                                });
                            }
                        },

                        'cancel': {
                            text: 'Скасувати',
                            btnClass: 'btn-blue',
                            action: function () {
                                // $.alert('you clicked on <strong>cancel</strong>');
                            }
                        }
                    }
                });
            });
        });
    </script>
@endsection
