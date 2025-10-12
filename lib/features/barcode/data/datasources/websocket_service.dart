import 'dart:async';
import 'dart:convert';

import 'package:credix_app/features/barcode/data/models/transaction_notification.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _controller = StreamController<TransactionNotification>.broadcast();

  Stream<TransactionNotification> get notifications => _controller.stream;

  Future<void> connect(String baseUrl, String userEmail) async {
    final uri = Uri.parse('$baseUrl/ws-raw?userEmail=$userEmail');
    _channel = WebSocketChannel.connect(uri);

    _channel!.stream.listen((event) {
      try {
        final decoded = jsonDecode(event.toString());
        if (decoded is Map<String, dynamic> && decoded.containsKey('transactionId')) {
          _controller.add(TransactionNotification.fromJson(decoded));
        }
      } catch (_) {}
    });
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}
