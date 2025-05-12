import 'package:credix_app/features/auth/data/models/login_response.dart';
import 'package:either_dart/either.dart';

abstract class LoginRepository {
  Future<Either<LoginResponse, String>> login({required String email, required String password});
}
