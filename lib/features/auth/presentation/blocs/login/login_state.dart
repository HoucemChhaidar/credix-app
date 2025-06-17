part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.credentialsLoaded({
    required String email,
    required String password,
    required bool rememberMe,
  }) = _CredentialsLoaded;


  const factory LoginState.success() = _Success;

  const factory LoginState.error({required String message}) = _Error;
}
