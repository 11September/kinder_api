@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/jquery-confirm.min.css') }}" rel="stylesheet">
@endsection

@section('content')

    <div class="container-fluid">

        <!-- Breadcrumbs-->
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

            <div class="col-md-4">
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


            <div class="col-md-8">

                <form action="{{ action('SchoolController@adminUpdate', $school->id) }}" method="post">
                    {{ csrf_field() }}
                    {{ method_field('PUT') }}


                    <div class="row">
                        <div class="col-md-6">
                            <h3>Редагування садка</h3>


                            <div class="form-group">
                                <label for="exampleFormControlSelect2">Назва садка</label>
                                <input type="text" name="name" class="form-control" required
                                       value="@if (old('name')) {{old('name')}} @else {{ $school->name }} @endif"
                                       placeholder="Назва садка">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Групи</label>

                                @foreach($groups as $group)
                                    @if(@$group->schools && count($group->schools ) > 0)
                                        <p class="no-marg"><span class="orange">Садки:</span></p>

                                        @foreach(@$group->schools as $group_school)
                                            @if ($loop->last)
                                                <i class="fas fa-hotel"></i><small class="small-school">{{ $group_school->name }}</small>
                                            @else
                                                <i class="fas fa-hotel"></i><small class="small-school">{{ $group_school->name . ", " }}</small>
                                            @endif
                                        @endforeach
                                    @endif

                                    <div class="form-check">
                                        <label class="container">
                                            {{ $group->name }}
                                            <input

                                            @foreach($school->groups as $item)
                                                @if($group->id == $item->id)
                                                    checked="checked"
                                                @endif
                                            @endforeach

                                                value="{{ $group->id }}" name="group_id[]"
                                                class="{{ $errors->has('group_id') ? ' is-invalid' : '' }}"
                                                type="checkbox">
                                            <span class="checkmark"></span>
                                        </label>

                                    </div>
                                @endforeach

                                @if ($errors->has('group_id'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('group_id') }}</strong>
                                    </span>
                                @endif

                            </div>
                        </div>

                        <div class="col-md-12">
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
                                    content: 'Попередження: при видаленні садка видаляться всі учні, розклад занять, розклад харчування, новини що належать даному садочку.',
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
