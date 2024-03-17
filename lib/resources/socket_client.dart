import 'package:web_socket_client/web_socket_client.dart';

class SocketClient {
  static final SocketClient _instance = SocketClient._internal();
  static final uri = Uri.parse('ws://localhost:8080');
  final WebSocket _socket;

  factory SocketClient() {
    return _instance;
  }

  SocketClient._internal() : _socket = WebSocket(uri);

  Stream<dynamic> get stream {
    return _socket.messages;
  }

  void sendMessage(String message) {
    _socket.send(message);
  }

  void closeConnection() {
    _socket.close(1000, 'CLOSE_NORMAL');
  }
}
