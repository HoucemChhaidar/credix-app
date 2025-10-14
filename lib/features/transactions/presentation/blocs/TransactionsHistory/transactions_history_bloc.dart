import 'package:bloc/bloc.dart';
import 'package:credix_app/features/transactions/data/models/transaction_response.dart';
import 'package:credix_app/features/transactions/domain/interfaces/i_transactions_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'transactions_history_bloc.freezed.dart';
part 'transactions_history_event.dart';
part 'transactions_history_state.dart';

@injectable
class TransactionsHistoryBloc extends Bloc<TransactionsHistoryEvent, TransactionsHistoryState> {
  TransactionsHistoryBloc(this._iTransactionsRepository) : super(const TransactionsHistoryState.initial()) {
    on<TransactionsHistoryEvent>((event, emit) async {
      await event.when(
        loadTransactionsHistory: () async {
          await loadTransactionsHistory(emit);
        },
      );
    });
  }

  final ITransactionsRepository _iTransactionsRepository;

  Future<void> loadTransactionsHistory(Emitter<TransactionsHistoryState> emit) async {
    emit(const TransactionsHistoryState.loading());

    final response = await _iTransactionsRepository.getMyTransactionsHistory();
    await response.fold(
      (left) async {
        if (left.isEmpty) {
          emit(const TransactionsHistoryState.empty());
        } else {
          await Future<void>.delayed(const Duration(milliseconds: 2000));
          emit(TransactionsHistoryState.transactionsHistoryLoaded(left));
        }
      },
      (right) async {
        emit(TransactionsHistoryState.error(right));
      },
    );
  }
}
