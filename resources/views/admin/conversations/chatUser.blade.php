@extends('admin.template.master')

@section('css')
    <style>
        .wrapper-chat {
            height: 50vh;
            overflow-y: scroll;
        }

        .message {
            padding: 10pt;
            border-radius: 5pt;
            margin: 5pt;
        }

        .owner {
            background-color: #ccd7e0;
            float: right;
        }

        .not_owner {
            background-color: #eaeff2;
            float: left;
        }
    </style>
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
            <li class="breadcrumb-item active">{{ $conversation->user2->name }} - {{ $conversation->user1->name }}</li>
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

                        <h3>Cписок груп</h3>

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
                                        @if($user->id == $conversation->user2_id || $user->id == $conversation->user1_id) active @endif">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">{{ $user->name }}</h5>
                                            <input class="user_id" type="hidden" name="user_id" value="{{ $user->id }}">
                                            <input class="conversation_id" type="hidden" name="conversation_id"
                                                   value="{{ $conversation->id }}">

                                            @php($count = 0)
                                            @foreach($user->messages as $message)
                                                @if($message->status == "unread")
                                                    @php($count++)
                                                @endif
                                            @endforeach

                                            @if($count != 0)
                                                <small class="badge badge-primary badge-pill">{{ $count }}</small>
                                            @else
                                                <small class="badge badge-primary badge-pill hide">{{ $count }}</small>
                                            @endif

                                        </div>
                                        <p class="mb-1">{{ $user->parent_name }}</p>
                                    </a>

                                @endforeach

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div id="wrapper-chat" class="wrapper-chat">

                            @if(isset($conversation->messages))
                                @foreach($conversation->messages as $message)

                                    <div
                                        class="chat-container @if($message->user_id == Auth::user()->id) darker @else normal @endif @if($message->status == "unread") unread @endif">
                                        <p>{{ $message->message }}</p>
                                        <span class="time-right">{{$message->created_at->diffForHumans()}}</span>
                                        <input type="hidden" class="message_id" name="message_id"
                                               value="{{ $message->id }}">
                                    </div>

                                @endforeach
                            @endif

                        </div>

                        <div class="panel-footer">
                            <textarea id="msg" class="form-control" placeholder="Напишіть своє повідомлення"></textarea>
                            <input type="hidden" id="csrf_token_input" value="{{csrf_token()}}"/>
                            <br/>
                            <div class="row">
                                <div class="col-md-offset-4 col-md-4">
                                    <button id="sbmbutton" class="btn btn-primary btn-block"
                                            onclick="button_send_msg()">Надіслати
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src="https://cdn.socket.io/socket.io-1.3.4.js"></script>
    <script>
        function setRead() {
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
                        count.text(0);
                        count.fadeOut();
                        $('.unread').removeClass('unread');
                    }

                }, error: function () {
                    console.log(data);
                }
            });
        }

        var socket = io.connect('{{ env('APP_URL') }}:8890');
        socket.emit('add user', {'client':{{Auth::user()->id}}, 'conversation':{{$conversation->id}}});

        socket.on('message', function (data) {

            console.log(data);

            $('#wrapper-chat').append(
                '<div class="chat-container normal unread">' +
                '<p>' + data.message + '</p>' +
                '<span class="time-right">Зараз</span>' +
                '</div>');

            scrollToEnd();

            var countObject = $('.list-group-item.active').find('.badge');
            var countUser = parseInt(countObject.text());
            if (!countUser) {
                countUser = 0;
            }
            countUser++;
            console.log(countUser);
            countObject.removeAttr("style");
            countObject.text(countUser);

            var totalCountObject = $('#counter_unread');
            var totalCount = parseInt(totalCountObject.text());
            totalCount++;
            totalCountObject.text(totalCount);

            setTimeout(function () {
                setRead();
            }, 4000);
        });

        $(document).ready(function () {
            setTimeout(function () {
                setRead();
            }, 3000);

            scrollToEnd();


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

        $(document).keypress(function (e) {
            if (e.which == 13) {
                var msg = $('#msg').val();
                $('#msg').val('');//reset
                send_msg(msg);
            }
        });

        function button_send_msg() {
            var msg = $('#msg').val();
            $('#msg').val('');//reset
            send_msg(msg);
        }

        function deleteBorder() {
            $('#msg').removeAttr("style");
        }

        function send_msg(msg) {
            $.ajax({
                headers: {'X-CSRF-Token': $('#csrf_token_input').val()},
                type: "POST",
                url: "{{route('admin.messages.store')}}",
                data: {
                    'message': msg,
                    'conversation_id':{{$conversation->id}},
                },
                success: function (data) {
                    if (data == true) {

                        $('#wrapper-chat').append(
                            '<div class="chat-container darker">' +
                            '<p>' + msg + '</p>' +
                            '<span class="time-right">Зараз</span>' +
                            '</div>');

                        scrollToEnd();

                        $('#msg').val('').focus();

                        setTimeout(function () {
                            setRead();
                        }, 3000);
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 422) {
                        $('#msg').val('').focus().css('border', '1px solid #de2929');

                        setTimeout(function () {
                            deleteBorder();
                        }, 2000);
                    }
                }
            });
        }

        function scrollToEnd() {
            var d = $('#wrapper-chat');
            d.scrollTop(d.prop("scrollHeight"));
        }

    </script>
@endsection
