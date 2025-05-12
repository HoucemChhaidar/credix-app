import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/core/data/network/models/network_request.dart';
import 'package:credix_app/core/data/network/models/network_request_body.dart';
import 'package:credix_app/core/data/network/models/network_response.dart';
import 'package:credix_app/core/data/network/providers/network_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginService with NetworkServiceProvider<BaseModel<dynamic, dynamic>> {
  Future<NetworkResponse<Object>> login({
    required Dio dio,
    required String email,
    required String password,
  }) async {
    final response = await executeRequest(
      dio,
      NetworkRequest(
        path: '/auth/login',
        type: NetworkRequestType.post,
        body: NetworkRequestBody.json({'email': email, 'password': password}),
      ),
    );
    return response;
  }
}
