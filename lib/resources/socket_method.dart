import 'dart:convert';

import 'package:tic_tac_toe/resources/socket_client.dart';

class SocketMethod {
  final SocketClient _socketClient = SocketClient();
  void createRoom(String name) {
    final Map<String, String> data = {
      'event': 'create-room',
      'data': name,
    };
    final String jsonData = json.encode(data);
    _socketClient.sendMessage(jsonData);
  }
}
