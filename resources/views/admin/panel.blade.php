@extends('admin.template.master')

@section('content')
    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-fw fa-comments"></i>
                        </div>
                        <p class="panel-heading">Садки</p>
                        <div class="mr-5 panel-count">{{ $schools }}</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/kindergartens') }}">
                        <span class="float-left">Докладніше</span>
                        <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-warning o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-fw fa-list"></i>
                        </div>
                        <p class="panel-heading">Групи</p>
                        <div class="mr-5 panel-count">{{ $groups }}</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/groups') }}">
                        <span class="float-left">Докладніше</span>
                        <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-success o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-fw fa-shopping-cart"></i>
                        </div>
                        <p class="panel-heading">Користувачi</p>
                        <div class="mr-5 panel-count">{{ $users }}</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/users') }}">
                        <span class="float-left">Докладніше</span>
                        <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-danger o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fas fa-fw fa-life-ring"></i>
                        </div>
                        <p class="panel-heading">Новини</p>
                        <div class="mr-5 panel-count">{{ $news }}</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="{{ url('admin/posts') }}">
                        <span class="float-left">Докладніше</span>
                        <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection
