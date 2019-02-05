let app = require('express')();
let server = require('http').Server(app);
let io = require('socket.io')(server);
server.listen(8890);


io.on('connection', (socket) => {

    console.log("connection");

    socket.on('disconnect', function () {

        console.log("disconect");

        io.emit('users-changed', {user: socket.nickname, event: 'left'});
    });

    socket.on('set-nickname', (nickname) => {
        socket.nickname = nickname;
        io.emit('users-changed', {user: nickname, event: 'joined'});
    });

    socket.on('message', (message) => {

        console.log("message", message);

        io.emit('message', {text: message.text, from: socket.nickname, created: new Date()});
    });
});


// var app = require('express')();
// var server = require('http').Server(app);
// var io = require('socket.io')(server);
// var redis = require('redis');
// server.listen(8890);
// users = {};
//
// var redisClient = redis.createClient();
//
// //if you set a password for your redis server
// /*
// redisClient.auth('password', function(err){
// 	if (err) throw err;
// });
// */
//
// redisClient.subscribe('message');
//
// redisClient.on("message", function (channel, data) {
//     var data = JSON.parse(data);
//     if (data.client_id in users) {
//         if (data.conversation_id in users[data.client_id]) {
//             users[data.client_id][data.conversation_id].emit("message", {
//                 "conversation_id": data.conversation_id,
//                 "message": data.message
//             });
//         }
//     }
// });
//
// io.on('connection', function (socket) {
//     socket.on("add user", function (data) {
//         if (!(data.client in users)) {
//             users[data.client] = {};
//         }
//         users[data.client][data.conversation] = socket;
//         socket.user_id = data.client;
//         socket.conversation_id = data.conversation;
//
//         console.log('user_id - ',data.client, " ;conversation - ", data.conversation)
//     });
//
//     socket.on('disconnect', function () {
//         if (!(socket.user_id in users)) return;
//         if (!(socket.conversation_id in users[socket.user_id])) return;
//
//
//
//         delete users[socket.user_id][socket.conversation_id];
//         if (Object.keys(users[socket.user_id]).length === 0) {
//             delete users[socket.user_id];
//         }
//     });
//
// });
