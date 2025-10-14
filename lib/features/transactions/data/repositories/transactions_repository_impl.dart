import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/features/transactions/data/datasources/transactions_service.dart';
import 'package:credix_app/features/transactions/data/models/transaction_response.dart';
import 'package:credix_app/features/transactions/domain/interfaces/i_transactions_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ITransactionsRepository)
class TransactionsRepositoryImpl implements ITransactionsRepository {
  TransactionsRepositoryImpl(this._service, this._dio);

  final TransactionsService _service;
  final Dio _dio;

  @override
  Future<Either<List<TransactionResponse>, String>> getMyTransactionsHistory() async {
    final response = await _service.getMyTransactionsHistory(dio: _dio);
    return response.when(
      ok: (data) {
        return Left<List<TransactionResponse>, String>(
          ((data as BaseModel).data as List)
              .map((x) => TransactionResponse.fromJson(x as Map<String, dynamic>))
              .toList(),
        );
      },
      badRequest: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      noAuth: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      noAccess: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      invalidParameters: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      notFound: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      conflict: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
      noData: (message) {
        return Right<List<TransactionResponse>, String>(message);
      },
    );
  }
}
