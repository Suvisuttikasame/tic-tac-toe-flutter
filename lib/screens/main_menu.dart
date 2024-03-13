import "package:flutter/material.dart";
import "package:tic_tac_toe/screens/create_room.dart";
import "package:tic_tac_toe/screens/join_room.dart";
import "package:tic_tac_toe/widgets/custom_button.dart";

class MainMenu extends StatefulWidget {
  static String mainMenuRoute = 'main-menu';
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void goToCreateRoom() {
    Navigator.pushNamed(context, CreateRoom.createRoomRoute);
  }

  void goToJoinRoom() {
    Navigator.pushNamed(context, JoinRoom.joinRoomRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: () => goToCreateRoom(), buttonLabel: 'create room'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () => goToJoinRoom(), buttonLabel: 'join room'),
          ],
        ),
      ),
    );
  }
}
