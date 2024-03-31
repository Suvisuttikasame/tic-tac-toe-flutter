import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/custom_text_field.dart';

class Lobby extends StatefulWidget {
  final String roomId;
  const Lobby({
    super.key,
    required this.roomId,
  });

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  final TextEditingController roomId = TextEditingController();

  @override
  void initState() {
    super.initState();
    roomId.text = widget.roomId;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Lobby'),
          const SizedBox(height: 20),
          CustomTextField(
            hintText: '',
            textEditingController: roomId,
            color: const Color.fromRGBO(16, 13, 34, 1),
            isDisabled: true,
          ),
        ],
      ),
    );
  }
}
