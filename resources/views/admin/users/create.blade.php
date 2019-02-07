@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">
                <a class="orange-text" href="{{ url('admin/users') }}">Користувачі</a>
            </li>
            <li class="breadcrumb-item ">
                Створення користувача
            </li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Створення користувача</h2>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                @if (Session::has('message'))
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        {{Session::get('message')}}
                                    </div>
                                @endif
                            </div>
                        </div>

                        @include('admin.partials.errors')

                        <form action="{{ action('StudentsController@adminStore') }}" method="post"
                              enctype="multipart/form-data">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">ПІБ дитини</label>
                                        <input required name="name" value="{{ old('name') }}" type="text" id="name"
                                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                               placeholder="ПІБ дитини">

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="birthday">Дата народження дитини</label>
                                        <input required name="birthday" value="{{ old('birthday') }}" type="date"
                                               max="2100-01-01" id="birthday"
                                               class="form-control {{ $errors->has('birthday') ? ' is-invalid' : '' }}"
                                               placeholder="Дата народження дитини">

                                        @if ($errors->has('birthday'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('birthday') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="parent_name">ПІБ Батька</label>
                                        <input required name="parent_name" value="{{ old('parent_name') }}" type="text" id="parent_name"
                                               class="form-control {{ $errors->has('parent_name') ? ' is-invalid' : '' }}"
                                               placeholder="ПІБ Батька">

                                        @if ($errors->has('parent_name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('parent_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="parent_phone">Номер Телефону Батьків</label>
                                        <input required name="parent_phone" value="{{ old('parent_phone') }}"
                                               type="text" id="parent_phone"
                                               class="mask-phone form-control {{ $errors->has('parent_phone') ? ' is-invalid' : '' }}"
                                               placeholder="Номер Телефону Батьків">

                                        @if ($errors->has('parent_phone'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('parent_phone') }}</strong>
                                            </span>
                                        @endif
                                    </div>


                                </div>
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input required type="email" name="email"
                                               class="form-control {{ $errors->has('email') ? ' is-invalid' : '' }}"
                                               id="email"
                                               value="{{ old('email') }}" placeholder="name@example.com">

                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="address">Адреса</label>
                                        <input type="text" name="address"
                                               class="form-control {{ $errors->has('address') ? ' is-invalid' : '' }}"
                                               id="address" value="{{ old('address') }}"
                                               placeholder="Адреса">

                                        @if ($errors->has('address'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('address') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Пароль</label>
                                        <input id="password" type="password"
                                               class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}"
                                               name="password" required>

                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm">Підтвердження паролю</label>
                                        <input id="password-confirm" type="password"
                                               class="form-control {{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                               name="password_confirmation" required>

                                        @if ($errors->has('password_confirmation'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password_confirmation') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="school_id">Садок</label>

                                        <select required name="school_id"
                                                class="form-control choose_school {{ $errors->has('school_id') ? ' is-invalid' : '' }}"
                                                id="school_id">

                                            @foreach($schools as $school)
                                                <option class="choose_school_option" {{ old("school_id") == $school->id ? "selected":"" }}
                                                        value="{{ $school->id }}">{{ $school->name }}</option>
                                            @endforeach

                                        </select>

                                        @if ($errors->has('school_id'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('school_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                    <div class="form-group">
                                        <label for="group_id">Група</label>
                                        <select required name="group_id"
                                                class="form-control choose_group_option {{ $errors->has('group_id') ? ' is-invalid' : '' }}"
                                                id="group_id">

                                            @if($groups)
                                                @foreach($groups as $group)
                                                    <option {{ old("school_id") == $group->id ? "selected":"" }} value="{{ $group->id }}">{{ $group->name }}</option>
                                                @endforeach
                                            @endif

                                        </select>

                                        @if ($errors->has('group_id'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('group_id') }}</strong>
                                            </span>
                                        @endif
                                    </div>

                                    <div class="form-group">
                                        <div class="form-row">

                                            <div class="form-group col-md-6">
                                                <label>Статус</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Активний
                                                        <input required value="active" type="radio"
                                                               checked="checked" name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Неактивний
                                                        <input required value="disable" type="radio" name="status">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                                @if ($errors->has('status'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('status') }}</strong>
                                                    </span>
                                                @endif
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label>Батько / Мати</label>

                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Батько
                                                        <input required value="father" type="radio"
                                                               checked="checked" name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <label class="container-checkbox">
                                                        Мати
                                                        <input required value="mother" type="radio" name="parents">
                                                        <span class="checkmark-radio"></span>
                                                    </label>
                                                </div>

                                                @if ($errors->has('parents'))
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('parents') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mb-2">Створити</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

@endsection

@section('scripts')
    <script src="{{ asset('administrator/js/jquery.inputmask.bundle.js') }}"></script>

    <script>
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
        if(dd<10){
            dd='0'+dd
        }
        if(mm<10){
            mm='0'+mm
        }

        today = yyyy+'-'+mm+'-'+dd;
        document.getElementById("birthday").setAttribute("max", today);


        $(document).ready(function () {
            $('.mask-phone').inputmask({"mask": "+38(099)-99-99-999"});

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
                                $('.choose_group_option').empty();

                                if (data.data && data.data !== '') {
                                    $.each(data.data, function (index, item) {
                                        console.log(item);
                                        $('.choose_group_option').append('<option  value="' + item.id + '">' + item.name + '</option>');
                                    });
                                } else {
                                    console.log("empty data");
                                    $('.choose_group_option').empty();
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
