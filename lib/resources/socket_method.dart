import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe/screens/game_room.dart';

class SocketMethod {
  final IO.Socket _socketClient = SocketClient.instance.socket;
  void createRoom(String name) {
    final Map<String, dynamic> data = {
      'event': 'create-room',
      'data': {
        'name': name,
      },
    };
    _socketClient.emit('create-room', data);
  }

  void listenOnCreateRoomSuccess(BuildContext context) {
    _socketClient.on('create-room-success', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
      Navigator.pushNamed(context, GameRoom.gameRoomRoute);
    });
  }

  void joinRoom(String name, String roomId) {
    if (name.isNotEmpty && roomId.isNotEmpty) {
      final Map<String, dynamic> data = {
        'event': 'join-room',
        'data': {
          'name': name,
          'roomId': roomId,
        },
      };
      _socketClient.emit('join-room', data);
    }
  }

  void listenOnJoinRoomSuccess(BuildContext context) {
    _socketClient.on('join-room-success', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
      Navigator.pushNamed(context, GameRoom.gameRoomRoute);
    });
  }

  void disConnectSocket() {
    _socketClient.close();
  }

  void onEventServer(BuildContext context) {
    _socketClient.onConnect((data) {
      print('connected to server');
    });
    _socketClient.onDisconnect((data) {
      print('disconnected to server');
    });
    _socketClient.onConnectError((data) {
      print('error connected to server');
    });
  }
}
