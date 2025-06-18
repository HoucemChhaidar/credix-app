import 'package:bloc/bloc.dart';
import 'package:credix_app/features/wallet/data/models/wallet_response.dart';
import 'package:credix_app/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

@injectable
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this._walletRepository) : super(const WalletState.initial()) {
    on<WalletEvent>((event, emit) async {
      await event.when(
        started: () async {
          await _onWalletStarted(emit: emit);
        },
      );
    });
  }

  final WalletRepository _walletRepository;

  Future<void> _onWalletStarted({required Emitter<WalletState> emit}) async {
    emit(const WalletState.loading());

    final response = await _walletRepository.myWallet();
    await response.fold(
      (wallet) async {
        await Future<void>.delayed(const Duration(milliseconds: 5000));
        emit(WalletState.success(wallet: wallet));
      },
      (error) {
        emit(WalletState.failure(message: error));
      },
    );
  }
}
