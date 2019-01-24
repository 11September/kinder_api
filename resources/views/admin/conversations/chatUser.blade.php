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
            <li class="breadcrumb-item active">{{ $conversation->user2->name }}</li>
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
                                            value="{{ $school->id }}">{{ $school->name }}</option>
                                @endforeach

                            </select>
                        </div>

                        <ul class="list-group list-group-flex" id="wrapper-list-groups">

                            @foreach($groups as $item)
                                <li class="list-group-item @if($item->id == $users[0]->group_id) active @endif">
                                    <a class="orange-text"
                                       href="{{ action('ConversationController@adminShowGroupUsers', $item->id) }}">{{ $item->name }}</a>
                                </li>
                            @endforeach

                        </ul>
                    </div>

                    <div class="col-md-3">
                        <div class="wrapper-users-for-chat">
                            <div class="list-group">

                                @foreach($users as $user)

                                    <a href="{{ action('ConversationController@checkConversation', $user->id) }}"
                                       class="list-group-item list-group-item-action flex-column align-items-start
                                        @if($user->id == $conversation->user2->id) active @endif">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">{{ $user->name }}</h5>
                                            <input class="user_id" type="hidden" name="user_id" value="{{ $user->id }}">

                                            @php($count = 0)
                                            @foreach($user->messages as $message)
                                                @if($message->status == "unread")
                                                    @php($count++)
                                                @endif
                                            @endforeach

                                            @if($count != 0)
                                                <small class="badge badge-primary badge-pill">{{ $count }}</small>
                                            @endif

                                            {{--<small class="badge badge-primary badge-pill">14</small>--}}
                                        </div>
                                        <p class="mb-1">{{ $user->parent_name }}</p>
                                        <small>{{ $user->parent_phone }}</small>

                                    </a>

                                @endforeach

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="wrapper-chat">

                            @if(isset($conversation->messages))
                                @foreach($conversation->messages as $message)

                                    <div
                                        class="chat-container @if($message->user_id == Auth::user()->id) darker @else normal @endif @if($message->status == "unread") unread @endif">
                                        <p>{{ $message->message }}</p>
                                        <span class="time-right">{{ $message->created_at }}</span>
                                    </div>

                                @endforeach
                            @endif

                        </div>


                        <form action="{{ action('MessagesController@adminStore') }}" method="post">
                            {{ csrf_field() }}

                            <input type="hidden" name="conversation_id" value="{{ $conversation->id }}">

                            <div class="form-group">
                                <textarea class="form-control" name="message" id="" cols="30" rows="3"></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Отправить</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            setTimeout(function () {

                var count = $('.list-group-item.active').find('.badge');
                var user_id = $('.list-group-item.active').find('.user_id').val();

                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },

                    type: 'get',
                    url: '/admin/messages/setReadMessages/' + user_id + '',
                    dataType: 'json',
                    // data: {id: user_id},
                    success: function (data) {

                        if (data.success) {
                            count.fadeOut();
                            $('.unread').removeClass('unread');
                        }

                    }, error: function () {
                        console.log(data);
                    }
                });

            }, 3000);


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