import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  static final SocketClient _instance = SocketClient._internal();
  static const uri = 'http://localhost:8080';
  late IO.Socket socket;

  factory SocketClient() {
    return _instance;
  }

  SocketClient._internal() {
    _initSocket();
  }

  void _initSocket() {
    socket = IO.io(uri, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();
  }

  static SocketClient get instance {
    return _instance;
  }
}
