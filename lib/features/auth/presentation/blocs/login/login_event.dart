part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loadSavedCredentials() = _LoadSavedCredentials;

  const factory LoginEvent.saveCredentials({required String username, required String password}) = _SaveCredentials;

  const factory LoginEvent.clearCredentials() = _ClearCredentials;

  const factory LoginEvent.login({
    required bool rememberMe,
    required String email,
    required String password,
  }) = _Login;
}
