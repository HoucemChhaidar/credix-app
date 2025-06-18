part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = _Initial;

  const factory WalletState.loading() = _Loading;

  const factory WalletState.success({required WalletResponse wallet}) = _Success;

  const factory WalletState.failure({required String message}) = _Failure;
}
