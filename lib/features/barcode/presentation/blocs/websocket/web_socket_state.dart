part of 'web_socket_bloc.dart';

@freezed
class WebSocketState with _$WebSocketState {
  const factory WebSocketState.initial() = _Initial;

  const factory WebSocketState.connected() = _Connected;

  const factory WebSocketState.disconnected() = _Disconnected;

  const factory WebSocketState.received(TransactionNotification notification) = _Received;

  const factory WebSocketState.error(String message) = _Error;
}
