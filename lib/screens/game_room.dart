import 'package:flutter/material.dart';

class GameRoom extends StatelessWidget {
  static const gameRoomRoute = '/game-room';
  const GameRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('game screen'),
      ),
    );
  }
}
