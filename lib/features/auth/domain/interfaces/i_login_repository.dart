import 'package:credix_app/features/auth/data/models/login_response.dart';
import 'package:either_dart/either.dart';

// ignore: one_member_abstracts
abstract class ILoginRepository {
  Future<Either<LoginResponse, String>> login({required String email, required String password});
}
