import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/model/player.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';
import 'package:tic_tac_toe/utils/show_dialog.dart';

class GameMethod {
  void checkWinner(BuildContext context) {
    final roomData = Provider.of<RoomDataProvider>(context, listen: false);
    Player player1 = roomData.player1;
    Player player2 = roomData.player2;
    Player? winner;
    int round = roomData.round;
    List<dynamic> dashboard = roomData.dashBoardData;
    //check row strike
    for (int i = 0; i < 7; i += 3) {
      if (dashboard[i] == dashboard[i + 1] &&
          dashboard[i] == dashboard[i + 2] &&
          dashboard[i] != '') {
        winner = findWinnerPlayer(player1, player2, dashboard[i]);
      }
    }

    //check col strike
    for (int i = 0; i < 3; i += 1) {
      if (dashboard[i] == dashboard[i + 3] &&
          dashboard[i] == dashboard[i + 6] &&
          dashboard[i] != '') {
        winner = findWinnerPlayer(player1, player2, dashboard[i]);
      }
    }

    //check cross strike
    for (int i = 0; i < 3; i += 2) {
      if (dashboard[i] == dashboard[4] &&
          dashboard[i] == dashboard[8 - i] &&
          dashboard[i] != '') {
        winner = findWinnerPlayer(player1, player2, dashboard[i]);
      }
    }
    //check draw
    if (round == 9 && winner == null) {
      ShowDialog().dialog(context, 'draw', 'continue', () {
        GameMethod().clearBoard(context);
        Navigator.pop(context);
      });
    }

    if (winner != null) {
      if (SocketMethod().getSocketID() == winner.socketID) {
        SocketMethod().updateWinner(winner.socketID, roomData.roomData['_id']);
      }
    }
  }

  Player findWinnerPlayer(Player p1, Player p2, String type) {
    if (p1.playerType == type) {
      return p1;
    } else {
      return p2;
    }
  }

  void clearBoard(BuildContext context) {
    Provider.of<RoomDataProvider>(context, listen: false).clearGamePlay();
  }
}
