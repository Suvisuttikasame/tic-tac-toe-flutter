import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final SocketMethod _socketMethod = SocketMethod();
  late String? socketID;

  @override
  void initState() {
    super.initState();
    _socketMethod.listenOnUpdateTap(context);
    socketID = _socketMethod.getSocketID();
  }

  @override
  Widget build(BuildContext context) {
    final roomData = Provider.of<RoomDataProvider>(context);
    final height = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.6, maxWidth: 700),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return AbsorbPointer(
            absorbing: roomData.roomData['turn']['socketID'] == socketID,
            child: GestureDetector(
              onTap: () {
                _socketMethod.getSocketID();
                _socketMethod.onTap(
                  context,
                  index,
                  roomData.roomData['turn']['playerType'],
                  roomData.roomData['_id'],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24, width: 2)),
                child: Center(
                  child: Text(
                    roomData.dashBoardData[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 30,
                            color: roomData.dashBoardData[index] == 'X'
                                ? Colors.blue
                                : Colors.red,
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
