import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class JoinRoom extends StatefulWidget {
  static String joinRoomRoute = '/join-room';
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _gameControler = TextEditingController();
  final TextEditingController _nameControler = TextEditingController();
  final SocketMethod _socketMethod = SocketMethod();

  @override
  void initState() {
    super.initState();
    _socketMethod.listenOnJoinRoomSuccess(context);
    _socketMethod.onEventServer(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameControler.dispose();
    _socketMethod.disConnectSocket();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              shadows: [
                Shadow(
                  blurRadius: 40,
                  color: Colors.white70,
                )
              ],
              text: 'JOIN ROOM',
              fontSize: 70,
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Responsive(
              child: CustomTextField(
                hintText: 'Enter name',
                textEditingController: _nameControler,
                color: const Color.fromRGBO(16, 13, 34, 1),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Responsive(
              child: CustomTextField(
                hintText: 'Enter game id',
                textEditingController: _gameControler,
                color: const Color.fromRGBO(16, 13, 34, 1),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(
                onPressed: () {
                  _socketMethod.joinRoom(
                      _nameControler.text, _gameControler.text);
                },
                buttonLabel: 'Join')
          ],
        ),
      ),
    );
  }
}
