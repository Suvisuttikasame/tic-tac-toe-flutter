import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe/resources/socket_method.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class CreateRoom extends StatefulWidget {
  static String createRoomRoute = '/create-room';
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameControler = TextEditingController();
  final SocketMethod _socketMethod = SocketMethod();

  @override
  void dispose() {
    super.dispose();
    _nameControler.dispose();
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
              text: 'CREATE ROOM',
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
            CustomButton(
                onPressed: () {
                  _socketMethod.createRoom(_nameControler.text);
                },
                buttonLabel: 'Create')
          ],
        ),
      ),
    );
  }
}
