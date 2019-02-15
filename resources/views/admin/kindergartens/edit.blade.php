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
                <a class="orange-text" href="{{ url('admin/kindergartens') }}">Садки</a>
            </li>
            <li class="breadcrumb-item active">{{ $school->name }}</li>
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

            <div class="col-lg-4 col-md-6">
                <h3>Список садкiв</h3>
                <ul class="list-group list-group-flex">

                    @foreach($schools as $schooll)
                        <li class="list-group-item @if($schooll->id == $school->id) active @endif">
                            <div>
                                <a class="orange-text"
                                   href="{{ action('SchoolController@adminEdit', $schooll->id) }}">
                                    {{ $schooll->name }}
                                </a>

                                <p class="group-count">Кількість груп : {{ $schooll->groups_count }}</p>

                                <p class="group-count">
                                    Групи:
                                    @foreach($school->groups as $group)
                                        <span class="orange-text moderator_group">
                                             <a class="reference_link"
                                                href="{{ action('GroupController@adminEdit', $group->id) }}">
                                                 <i class="fas fa-layer-group"></i>{{ $group->name }}
                                             </a>
                                        </span>
                                    @endforeach
                                </p>
                            </div>


                            <div class="wrapper-school-delete">
                                <form id="delete-form" method="POST" action="/admin/kindergartens/{{$schooll->id}}">
                                    {{ csrf_field() }}
                                    {{ method_field('DELETE') }}

                                    <div class="form-group">
                                        <input type="submit" class="btn btn-danger del-school" value="&#10008">
                                    </div>
                                </form>
                            </div>
                        </li>
                    @endforeach

                </ul>
            </div>


            <div class="col-lg-8 col-md-6">

                <form action="{{ action('SchoolController@adminUpdate', $school->id) }}" method="post">
                    {{ csrf_field() }}
                    {{ method_field('PUT') }}


                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <h3>Редагування садка</h3>


                            <div class="form-group">
                                <label for="name">Назва садка</label>
                                <input type="text" name="name" class="form-control" required id="name"
                                       value="@if (old('name')) {{old('name')}} @else {{ $school->name }} @endif"
                                       placeholder="Назва садка">
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Оновити</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src="{{ asset('administrator/js/jquery-confirm.min.js') }}"></script>

    <script>
        $(document).ready(function () {
            $('.del-school').click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var clicked = $(e.target);

                $.confirm({
                    // useBootstrap: false,
                    title: 'Видалення садка',
                    content: 'Підтвердіть видалення садка',
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
                                    title: 'Підтвердіть видалення садка',
                                    content: 'Попередження: при видаленні садка видаляться всі учні, розклад занять, розклад харчування, групи, новини що належать даному садочку. Всі вихователі будуть неактивні і відв\'язані від груп!',
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
