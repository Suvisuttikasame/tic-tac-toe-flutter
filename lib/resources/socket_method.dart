import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe/screens/game_room.dart';

class SocketMethod {
  final IO.Socket _socketClient = SocketClient.instance.socket;
  void createRoom(String name) {
    final Map<String, String> data = {
      'event': 'create-room',
      'data': name,
    };
    _socketClient.emit('create-room', data);
  }

  void listenStream(BuildContext context) {
    _socketClient.on('create-room-success',
        (data) => {Navigator.pushNamed(context, GameRoom.gameRoomRoute)});
  }
}
