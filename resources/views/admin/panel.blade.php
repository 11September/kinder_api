@extends('admin.template.master')

@section('content')
    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
        </ol>


        <div class="col-md-12">
            @if (Session::has('error'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    {{Session::get('error')}}
                </div>
            @endif
        </div>

        @include('admin.partials.errors')

        <div class="row">
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-hotel"></i>
                        </div>
                        <p class="panel-heading">Садки</p>
                        <div class="mr-5 panel-count">{{ $schools }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/kindergartens') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                             <i class="fas fa-angle-right"></i>
                        </span>
                        </a>
                    @endif
                </div>
            </div>
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-info o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-key"></i>
                        </div>
                        <p class="panel-heading">Адміністрація</p>
                        <div class="mr-5 panel-count">{{ $admins }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/admins') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                            <i class="fas fa-angle-right"></i>
                          </span>
                        </a>
                    @endif

                </div>
            </div>
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-success o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <p class="panel-heading">Користувачi</p>
                        <div class="mr-5 panel-count">{{ $users }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/users') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                            <i class="fas fa-angle-right"></i>
                          </span>
                        </a>
                    @endif

                </div>
            </div>
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-warning o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-layer-group"></i>
                        </div>
                        <p class="panel-heading">Групи</p>
                        <div class="mr-5 panel-count">{{ $groups }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/groups') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                            <i class="fas fa-angle-right"></i>
                          </span>
                        </a>
                    @endif

                </div>
            </div>
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-danger o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-newspaper"></i>
                        </div>
                        <p class="panel-heading">Новини</p>
                        <div class="mr-5 panel-count">{{ $news }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/posts') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                            <i class="fas fa-angle-right"></i>
                          </span>
                        </a>
                    @endif

                </div>
            </div>
            <div class="col-xl-4 col-sm-6 mb-3">
                <div class="card text-white bg-secondary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-comments"></i>
                        </div>
                        <p class="panel-heading">Листування</p>
                        <div class="mr-5 panel-count">{{ $messages }}</div>
                    </div>

                    @if(Auth::user()->type == "admin")
                        <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/conversations') }}">
                            <span class="float-left">Докладніше</span>
                            <span class="float-right">
                                <i class="fas fa-angle-right"></i>
                            </span>
                        </a>
                    @endif

                </div>
            </div>
        </div>
    </div>
@endsection
