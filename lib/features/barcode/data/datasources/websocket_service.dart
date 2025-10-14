import 'dart:async';
import 'dart:convert';

import 'package:credix_app/core/constants/app_endpoints.dart';
import 'package:credix_app/core/utils/user_preferences.dart';
import 'package:credix_app/features/barcode/data/models/transaction_notification.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _controller = StreamController<TransactionNotification>.broadcast();

  Stream<TransactionNotification> get notifications => _controller.stream;

  Future<void> connect() async {
    final userEmail = await UserPreferences.getUserEmail();
    final uri = Uri.parse('${AppEndpoints.wsBaseUrl}/ws-raw?userEmail=$userEmail');
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
