import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';
import 'package:tic_tac_toe/widgets/game_board.dart';
import 'package:tic_tac_toe/widgets/lobby.dart';
import 'package:tic_tac_toe/widgets/score_board.dart';

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
    _socketMethod.listenOnUpdatePlayer(context);
    _socketMethod.listenOnEndGame(context);
  }

  @override
  Widget build(BuildContext context) {
    final roomData = Provider.of<RoomDataProvider>(context).roomData;
    return Scaffold(
      body: roomData['isJoin']
          ? Lobby(
              roomId: roomData['_id'],
            )
          : SafeArea(
              child: Column(
                children: [
                  const ScoreBoard(),
                  const GameBoard(),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    '${roomData['turn']['name']}\'s turn',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
