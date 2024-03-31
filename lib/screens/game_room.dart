import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';
import 'package:tic_tac_toe/widgets/lobby.dart';

class GameRoom extends StatefulWidget {
  static const gameRoomRoute = '/game-room';
  const GameRoom({super.key});

  @override
  State<GameRoom> createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  final SocketMethod _socketMethod = SocketMethod();

  @override
  void initState() {
    super.initState();
    _socketMethod.listenOnUpdateRoom(context);
  }

  @override
  Widget build(BuildContext context) {
    final roomData = Provider.of<RoomDataProvider>(context).roomData;
    return Scaffold(
      body: roomData['isJoin']
          ? Lobby(
              roomId: roomData['_id'],
            )
          : Center(
              child: Text(
                  Provider.of<RoomDataProvider>(context).roomData.toString()),
            ),
    );
  }
}
