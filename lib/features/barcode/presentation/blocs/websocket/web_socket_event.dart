part of 'web_socket_bloc.dart';

@freezed
class WebSocketEvent with _$WebSocketEvent {
  const factory WebSocketEvent.connect() = _Connect;

  const factory WebSocketEvent.disconnect() = _Disconnect;
}
