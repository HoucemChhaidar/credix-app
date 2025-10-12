import 'package:bloc/bloc.dart';
import 'package:credix_app/core/constants/app_endpoints.dart';
import 'package:credix_app/core/utils/user_preferences.dart';
import 'package:credix_app/features/barcode/data/datasources/websocket_service.dart';
import 'package:credix_app/features/barcode/data/models/transaction_notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_socket_bloc.freezed.dart';
part 'web_socket_event.dart';
part 'web_socket_state.dart';

class WebSocketBloc extends Bloc<WebSocketEvent, WebSocketState> {
  WebSocketBloc(this._service) : super(const WebSocketState.initial()) {
    on<WebSocketEvent>((event, emit) async {
      await event.when(
        connect: () async {
          emit(const WebSocketState.initial());
          try {
            const baseUrl = AppEndpoints.wsBaseUrl;
            final userEmail = await UserPreferences.getUserEmail();
            await _service.connect(baseUrl, userEmail!);
            emit(const WebSocketState.connected());

            await for (final notification in _service.notifications) {
              emit(WebSocketState.received(notification));
            }
          } catch (e) {
            emit(WebSocketState.error(e.toString()));
          }
        },
        disconnect: () async {
          _service.disconnect();
          emit(const WebSocketState.disconnected());
        },
      );
    });
  }

  final WebSocketService _service;
}
