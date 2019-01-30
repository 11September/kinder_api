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
                <div class="row">
                    <div class="col-md-4">
                        <h3>Список груп</h3>

                        <ul class="list-group list-group-flex">

                            @foreach($groups as $list_groups)
                                <li class="list-group-item @if($list_groups->id == $group->id) active @endif">

                                    <div>
                                        <a href="{{ action('GroupController@adminEdit', $list_groups->id) }}">
                                            {{ $list_groups->name }}
                                        </a>

                                        <p class="group-count">{{ $list_groups->students_count }} чоловiк</p>
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

                    <div class="col-md-8">
                        <h3 style="text-align: center">Оновити групу</h3>

                        <form action="{{ action('GroupController@adminUpdate', $group->id) }}" method="post">
                            {{ csrf_field() }}
                            {{ method_field('PUT') }}

                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Садок</label>

                                        @foreach($schools as $school)

                                            <div class="form-check">
                                                <label class="container-checkbox">
                                                    {{ $school->name }}
                                                    <input required value="{{ $school->id }}" type="radio"
                                                           name="school_id"

                                                           @foreach($group->schools as $value)
                                                           @if($school->id == $value->id)
                                                           checked
                                                        @endif
                                                        @endforeach>

                                                    <span class="checkmark-radio"></span>
                                                </label>
                                            </div>

                                        @endforeach
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Назва групи</label>
                                        <input required type="text" value="{{ $group->name }}" name="name"
                                               class="form-control" id="name"
                                               placeholder="Название Группы">
                                    </div>

                                    <div class="form-group">
                                        <label for="user_id">Вибрати адміністратора</label>
                                        <select required name="user_id" class="form-control" id="user_id">

                                            @foreach($admins as $administrator)
                                                <option @if($administrator->id == @$group->user_id) selected @endif
                                                value="{{ $administrator->id }}">{{ $administrator->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="moderator_id">Вибрати вихователя</label>
                                        <select required name="moderator_id" class="form-control" id="moderator_id">

                                            @foreach($moderators as $moderator)
                                                <option @if($moderator->id == @$group->moderator_id) selected @endif
                                                value="{{ $moderator->id }}">{{ $moderator->name }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary mb-2">Оновити</button>
                                </div>
                            </div>
                        </form>
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
                                    content: 'Попередження: при видаленні групи видаляться: розклад зайнять, розклад харчування, новини.',
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
