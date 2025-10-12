import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/features/wallet/data/datasources/wallet_service.dart';
import 'package:credix_app/features/wallet/data/models/wallet_response.dart';
import 'package:credix_app/features/wallet/domain/interfaces/i_wallet_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWalletRepository)
class WalletRepositoryImpl implements IWalletRepository {
  WalletRepositoryImpl(this._service, this._dio);

  final WalletService _service;
  final Dio _dio;

  @override
  Future<Either<WalletResponse, String>> myWallet() async {
    final response = await _service.myWallet(dio: _dio);
    return response.when(
      ok: (data) {
        return Left<WalletResponse, String>(WalletResponse.fromJson((data as BaseModel).data as Map<String, dynamic>));
      },
      badRequest: (message) {
        return Right<WalletResponse, String>(message);
      },
      noAuth: (message) {
        return Right<WalletResponse, String>(message);
      },
      noAccess: (message) {
        return Right<WalletResponse, String>(message);
      },
      invalidParameters: (message) {
        return Right<WalletResponse, String>(message);
      },
      notFound: (message) {
        return Right<WalletResponse, String>(message);
      },
      conflict: (message) {
        return Right<WalletResponse, String>(message);
      },
      noData: (message) {
        return Right<WalletResponse, String>(message);
      },
    );
  }
}
