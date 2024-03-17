import 'package:web_socket_channel/web_socket_channel.dart';

class SocketClient {
  static final SocketClient _instance = SocketClient._internal();
  static final uri = Uri.parse('ws://localhost:8080');
  final WebSocketChannel _socket;

  factory SocketClient() {
    return _instance;
  }

  SocketClient._internal() : _socket = WebSocketChannel.connect(uri);

  Stream<dynamic> get stream {
    return _socket.stream;
  }

  void sendMessage(String message) {
    _socket.sink.add(message);
  }

  void closeConnection() {
    _socket.sink.close(1000, 'CLOSE_NORMAL');
  }
}
