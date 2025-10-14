import 'package:credix_app/features/transactions/data/models/transaction_response.dart';
import 'package:either_dart/either.dart';

// ignore: one_member_abstracts
abstract class ITransactionsRepository {
  Future<Either<List<TransactionResponse>, String>> getMyTransactionsHistory();
}
