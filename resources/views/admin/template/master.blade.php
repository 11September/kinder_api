<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Dashboard</title>

    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Bootstrap core CSS-->
    <link href="{{ asset('administrator/css/bootstrap.min.css') }}" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
          integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

    <!-- Custom styles for this template-->
    <link href="{{ asset('administrator/css/sb-admin.css') }}" rel="stylesheet">


    @yield('css')

</head>

<body id="page-top">

@include('admin.partials.navbar')

<div id="wrapper">

    @include('admin.partials.sidebar')

    <div id="content-wrapper">
        @yield('content')
    </div>

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script src="{{ asset('administrator/js/jquery.min.js') }}"></script>
<script src="{{ asset('administrator/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('administrator/js/sb-admin.js') }}"></script>

@yield('scripts')

</body>
</html>
