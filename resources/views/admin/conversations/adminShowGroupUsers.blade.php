@extends('admin.template.master')

@section('css')

@endsection

@section('content')

    <div class="container-fluid">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin') }}">Головна сторінка</a>
            </li>
            <li class="breadcrumb-item">
                <a class="orange-text" href="{{ url('admin/conversations') }}">Листування</a>
            </li>
            <li class="breadcrumb-item active">{{ $group->name }}</li>
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
                        Листування
                    </div>

                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        <h3>Cписок cадкiв</h3>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Садок</label>
                            <select required name="school_id"
                                    class="form-control choose_school {{ $errors->has('school_id') ? ' is-invalid' : '' }}"
                                    id="exampleFormControlSelect1">

                                @foreach($list_schools as $school)
                                    <option class="choose_school_option"

                                            @foreach($school->groups as $item)
                                            @if($item->id == $group->id)
                                            selected
                                            @endif
                                            @endforeach

                                            value="{{ $school->id }}">{{ $school->name }}</option>
                                @endforeach

                            </select>
                        </div>

                        <h3>Cписок груп</h3>

                        <ul class="list-group list-group-flex" id="wrapper-list-groups">

                            <li class="list-group-item active">
                                <a class="orange-text"
                                   href="{{ action('ConversationController@adminShowGroupUsers', $group->id) }}">{{ $group->name }}</a>
                            </li>

                        </ul>
                    </div>

                    <div class="col-md-3">
                        <div class="wrapper-users-for-chat">
                            <div class="list-group">

                                @foreach($users as $user)

                                    <a href="{{ action('ConversationController@checkConversation', $user->id) }}"
                                       class="list-group-item list-group-item-action flex-column align-items-start">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">{{ $user->name }}</h5>

                                            @if($user->count != 0)
                                                <small class="badge badge-primary badge-pill">{{ $user->count }}</small>
                                            @endif

                                        </div>
                                        @if($user->type == "moderator")
                                            <p class="orange-text mb-1">Вихователь</p>
                                        @endif

                                        <p class="mb-1">{{ @$user->parent_name }}</p>
                                        <small>{{ @$user->parent_phone }}</small>

                                    </a>

                                @endforeach

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">

                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
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
                                $('#wrapper-list-groups').empty();

                                if (data.data && data.data !== '') {
                                    $.each(data.data, function (index, item) {
                                        console.log(item);

                                        $('#wrapper-list-groups').append(
                                            '<li class="list-group-item">' +
                                            '<a class="orange-text" href="/admin/conversations/group/' + item.id + '">' + item.name + '</a>' +
                                            '</li>'
                                        );
                                    });
                                } else {
                                    console.log("empty data");
                                    $('#wrapper-list-groups').empty();
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
