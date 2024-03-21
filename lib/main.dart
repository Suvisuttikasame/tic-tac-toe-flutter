import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/create_room.dart';
import 'package:tic_tac_toe/screens/game_room.dart';
import 'package:tic_tac_toe/screens/join_room.dart';
import 'package:tic_tac_toe/screens/main_menu.dart';
import 'package:tic_tac_toe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(scaffoldBackgroundColor: bgColor),
      routes: {
        MainMenu.mainMenuRoute: (context) => const MainMenu(),
        JoinRoom.joinRoomRoute: (context) => const JoinRoom(),
        CreateRoom.createRoomRoute: (context) => const CreateRoom(),
        GameRoom.gameRoomRoute: (context) => const GameRoom()
      },
      initialRoute: MainMenu.mainMenuRoute,
      home: const MainMenu(),
    );
  }
}
