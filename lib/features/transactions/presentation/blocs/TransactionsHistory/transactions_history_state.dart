part of 'transactions_history_bloc.dart';

@freezed
class TransactionsHistoryState with _$TransactionsHistoryState {
  const factory TransactionsHistoryState.initial() = _Initial;

  const factory TransactionsHistoryState.loading() = _Loading;

  const factory TransactionsHistoryState.empty() = _Empty;

  const factory TransactionsHistoryState.transactionsHistoryLoaded(
    List<TransactionResponse> transactions,
  ) = _TransactionsHistoryLoaded;

  const factory TransactionsHistoryState.error(String errorMessage) = _Error;
}
