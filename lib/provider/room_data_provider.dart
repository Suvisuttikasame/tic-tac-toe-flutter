import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  List<dynamic> _dashboardData = ['', '', '', '', '', '', '', '', ''];
  int _round = 0;
  Player _player1 = Player(
    name: '',
    points: 0,
    socketID: '',
    playerType: 'X',
  );
  Player _player2 = Player(
    name: '',
    points: 0,
    socketID: '',
    playerType: 'O',
  );

  Map<String, dynamic> get roomData => _roomData;
  List<dynamic> get dashBoardData => _dashboardData;
  int get round => _round;

  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> updateData) {
    _roomData = updateData;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> json) {
    _player1 = Player.fromJson(json);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> json) {
    _player2 = Player.fromJson(json);
    notifyListeners();
  }

  void updateDashBoard(List<dynamic> dashBoard) {
    _dashboardData = dashBoard;
    notifyListeners();
  }

  void updateRound() {
    _round += 1;
    notifyListeners();
  }

  void clearGamePlay() {
    _dashboardData = ['', '', '', '', '', '', '', '', ''];
    _round = 0;
    notifyListeners();
  }

  void resetState() {
    _roomData = {};
    _dashboardData = ['', '', '', '', '', '', '', '', ''];
    _round = 0;
    _player1 = Player(
      name: '',
      points: 0,
      socketID: '',
      playerType: 'X',
    );
    _player2 = Player(
      name: '',
      points: 0,
      socketID: '',
      playerType: 'O',
    );
  }
}
