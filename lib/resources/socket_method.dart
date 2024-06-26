import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/game_method.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe/screens/game_room.dart';
import 'package:tic_tac_toe/screens/main_menu.dart';
import 'package:tic_tac_toe/utils/show_dialog.dart';
import 'package:tic_tac_toe/utils/show_snackbar.dart';

class SocketMethod {
  final IO.Socket _socketClient = SocketClient.instance.socket;

  String? getSocketID() {
    return _socketClient.id;
  }

  void connectSocket() {
    _socketClient.connect();
  }

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

  void updateWinner(String winnerId, String roomId) {
    final Map<String, dynamic> data = {
      'event': 'winner',
      'data': {
        'winnerId': winnerId,
        'roomId': roomId,
      },
    };
    _socketClient.emit('winner', data);
  }

  void listenOnJoinRoomSuccess(BuildContext context) {
    _socketClient.on('join-room-success', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
      Navigator.pushNamed(context, GameRoom.gameRoomRoute);
    });
  }

  void listenOnUpdatePlayer(BuildContext context) {
    _socketClient.on('update-player', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(data[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(data[1]);
    });
  }

  void listenOnUpdateRoom(BuildContext context) {
    _socketClient.on('update-room', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }

  void disConnectSocket() {
    _socketClient.clearListeners();
    _socketClient.close();
  }

  void onEventServer(BuildContext context) {
    _socketClient.onConnect((data) {
      showSuccessSnackBar(context, 'connected to server');
    });
    _socketClient.on(
        'error-occur', (data) => {showErrorSnackBar(context, data)});
    _socketClient.onConnectError((data) {
      showErrorSnackBar(context, 'error connected to server');
    });
  }

  void onTap(BuildContext context, int index, String type, String roomId) {
    final dashBoard =
        Provider.of<RoomDataProvider>(context, listen: false).dashBoardData;

    if (dashBoard[index] == '') {
      dashBoard[index] = type;
      final Map<String, dynamic> data = {
        'event': 'join-room',
        'data': {
          'roomId': roomId,
          'dashBoard': dashBoard,
        },
      };
      _socketClient.emit('on-tap', data);
    }
  }

  void listenOnUpdateTap(BuildContext context) {
    _socketClient.on('update-on-tap', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateDashBoard(data['dashBoard']);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data['room']);
      Provider.of<RoomDataProvider>(context, listen: false).updateRound();
      GameMethod().checkWinner(context);
    });
  }

  void listenOnEndGame(BuildContext context) {
    _socketClient.on(
        'end-game',
        (data) => {
              if (data['isEnd'])
                {
                  ShowDialog().dialog(
                      context,
                      'Congraturation! ${data['winner']['name']} is a winner',
                      'end game', () {
                    Provider.of<RoomDataProvider>(context, listen: false)
                        .resetState();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        MainMenu.mainMenuRoute, (Route route) => false);
                  })
                }
              else
                {
                  ShowDialog().dialog(
                      context, '${data['winner']['name']} win', 'continue', () {
                    GameMethod().clearBoard(context);
                    Navigator.pop(context);
                  })
                }
            });
  }
}
