@extends('admin.template.master')

@section('css')
    <link href="{{ asset('administrator/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')
    <div class="container-fluid">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Адміністрація</li>
        </ol>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">

                    <div class="card-header">
                        <h2>Створити адміністратора</h2>
                    </div>

                    <div class="card-body">

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

                        @include('admin.partials.errors')

                        <form action="{{ url('admin/admins/store') }}" method="post">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="col-md-4 ">
                                    <div class="form-group">
                                        <label for="name">ПІБ</label>
                                        <input required name="name" value="{{ old('name') }}" type="text" id="name"
                                               class="form-control {{ $errors->has('name') ? ' is-invalid' : '' }}"
                                               placeholder="ПІБ">

                                        @if ($errors->has('name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                        @endif
                                    </div>

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
                                </div>

                                <div class="col-md-4">
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
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="birthday">Дата народження</label>
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
                                        <label for="type">Роль</label>
                                        <select name="type" id="type"
                                                class="form-control {{ $errors->has('type') ? ' is-invalid' : '' }}">
                                            <option value="admin">Адміністратор</option>
                                            <option value="moderator">Вихователь групи</option>
                                        </select>

                                        @if ($errors->has('type'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('type') }}</strong>
                                            </span>
                                        @endif

                                    </div>

                                </div>

                                <div class="col-md-12">
                                    <div class="form-group float-right">
                                        <button type="submit" class="btn btn-primary mb-2">Створити</button>
                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Адміністрація
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Iм'я</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Статус</th>
                            <th>Дії</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Iм'я</th>
                            <th>Email</th>
                            <th>Тип</th>
                            <th>Статус</th>
                            <th>Дії</th>
                        </tr>
                        </tfoot>
                        <tbody>

                        @foreach($users as $user)
                            <tr>
                                <td>{{ $user->name }}</td>
                                <td><a class="orange-text" href="mailto:{{ $user->email }}">{{ $user->email }}</a></td>
                                <td class="admin-type-text">
                                    @if($user->type == "moderator")
                                        Вихователь групи
                                    @endif
                                    @if($user->type == "admin")
                                        Адміністратор
                                    @endif
                                </td>
                                <td>
                                    @if($user->status == "active" && ($user->type == "admin" || $user->type == "moderator"))
                                        <span class="success font-weght-6">Активний</span>
                                    @elseif($user->status == "disable" && $user->type == "moderator")
                                        <span class="attention font-weght-6">НЕ прив'язаний до групи</span>
                                    @else
                                        <span class="not-active font-weght-6">Не активний</span>
                                    @endif
                                </td>

                                <td class="action-td">
                                    <a class="btn btn-warning"
                                       href="{{ action('AdminController@adminEdit', $user->id) }}">Редагувати</a>

                                    <form method="POST" action="/admin/admins/delete/{{$user->id}}">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}

                                        <div class="form-group">
                                            <input type="submit" class="btn btn-danger" value="Вилучити">
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

@endsection

@section('scripts')

    <script src="{{ asset('administrator/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('administrator/js/dataTables.bootstrap4.js') }}"></script>

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
            $('#dataTable').DataTable({
                "language": {
                    "sProcessing": "Зачекайте...",
                    "sLengthMenu": "Показати _MENU_ записів",
                    "sZeroRecords": "Записи відсутні.",
                    "sInfo": "Записи з _START_ по _END_ із _TOTAL_ записів",
                    "sInfoEmpty": "Записи з 0 по 0 із 0 записів",
                    "sInfoFiltered": "(відфільтровано з _MAX_ записів)",
                    "sInfoPostFix": "",
                    "sSearch": "Пошук:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Перша",
                        "sPrevious": "Попередня",
                        "sNext": "Наступна",
                        "sLast": "Остання"
                    },
                    "oAria": {
                        "sSortAscending": ": активувати для сортування стовпців за зростанням",
                        "sSortDescending": ": активувати для сортування стовпців за спаданням"
                    }
                }
            });
        });
    </script>
@endsection
