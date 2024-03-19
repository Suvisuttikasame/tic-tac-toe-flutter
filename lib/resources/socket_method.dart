import 'dart:convert';

import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketMethod {
  final IO.Socket _socketClient = SocketClient.instance.socket;
  void createRoom(String name) {
    final Map<String, String> data = {
      'event': 'create-room',
      'data': name,
    };
    _socketClient.emit('create-room', data);
  }
}
