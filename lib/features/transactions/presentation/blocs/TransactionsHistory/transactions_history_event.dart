part of 'transactions_history_bloc.dart';

@freezed
class TransactionsHistoryEvent with _$TransactionsHistoryEvent {
  const factory TransactionsHistoryEvent.loadTransactionsHistory() = _LoadTransactionsHistory;
}
