import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/features/stores/data/datasources/stores_service.dart';
import 'package:credix_app/features/stores/data/models/store_response.dart';
import 'package:credix_app/features/stores/domain/interfaces/i_stores_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStoresRepository)
class StoresRepositoryImpl implements IStoresRepository {
  StoresRepositoryImpl(this._service, this._dio);

  final StoresService _service;
  final Dio _dio;

  @override
  Future<Either<List<StoreResponse>, String>> getAllStores() async {
    final response = await _service.getAllStores(dio: _dio);
    return response.when(
      ok: (data) {
        return Left<List<StoreResponse>, String>(
          ((data as BaseModel).data as List).map((x) => StoreResponse.fromJson(x as Map<String, dynamic>)).toList(),
        );
      },
      badRequest: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      noAuth: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      noAccess: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      invalidParameters: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      notFound: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      conflict: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
      noData: (message) {
        return Right<List<StoreResponse>, String>(message);
      },
    );
  }
}
