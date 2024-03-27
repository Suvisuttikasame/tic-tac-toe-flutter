import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';

class GameRoom extends StatelessWidget {
  static const gameRoomRoute = '/game-room';
  const GameRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Provider.of<RoomDataProvider>(context).roomData.toString()),
      ),
    );
  }
}
