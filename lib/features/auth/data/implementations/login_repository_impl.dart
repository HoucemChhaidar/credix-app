import 'package:credix_app/features/auth/data/models/login_response.dart';
import 'package:credix_app/features/auth/data/repositories/login_repository.dart';
import 'package:credix_app/features/auth/data/services/login_service.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._service, this._dio);

  final LoginService _service;
  final Dio _dio;

  @override
  Future<Either<LoginResponse, String>> login({required String email, required String password}) async {
    final response = await _service.login(dio: _dio, email: email, password: password);
    return response.when(
      ok: (data) {
        return Left<LoginResponse, String>(LoginResponse.fromJson(data.data as Map<String, dynamic>));
      },
      badRequest: (message) {
        return Right<LoginResponse, String>(message);
      },
      noAuth: (message) {
        return Right<LoginResponse, String>(message);
      },
      noAccess: (message) {
        return Right<LoginResponse, String>(message);
      },
      invalidParameters: (message) {
        return Right<LoginResponse, String>(message);
      },
      notFound: (message) {
        return Right<LoginResponse, String>(message);
      },
      conflict: (message) {
        return Right<LoginResponse, String>(message);
      },
      noData: (message) {
        return Right<LoginResponse, String>(message);
      },
    );
  }
}
