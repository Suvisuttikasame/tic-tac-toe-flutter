import 'dart:convert';

class Player {
  final String name;
  final String socketID;
  final int points;
  final String playerType;

  Player({
    required this.name,
    required this.socketID,
    required this.points,
    required this.playerType,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      socketID: json['socketID'],
      points: json['points'],
      playerType: json['playerType'],
    );
  }
}
