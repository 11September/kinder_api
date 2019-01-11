@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Повідомлення</li>
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

                    @foreach($schools as $school)
                        <li class="list-group-item">
                            <div>
                                <a class="orange-text"
                                   href="{{ action('NotificationsController@adminEdit', $school->id) }}">
                                    {{ $school->name }}
                                </a>

                                <p class="group-count">Кількість груп : {{ $school->groups_count }}</p>
                            </div>
                        </li>
                    @endforeach

                </ul>
            </div>


            <div class="col-md-8">

            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection
