import 'package:credix_app/core/constants/app_endpoints.dart';
import 'package:credix_app/core/data/local/token_storage.dart';
import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/core/data/network/models/network_request.dart';
import 'package:credix_app/core/data/network/models/network_request_body.dart';
import 'package:credix_app/core/data/network/models/network_response.dart';
import 'package:credix_app/core/data/network/providers/network_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class WalletService with NetworkServiceProvider<BaseModel<dynamic, dynamic>> {
  Future<NetworkResponse<Object>> myWallet({required Dio dio}) async {
    final token = await TokenStorage.getToken();
    if (token == null || token.isEmpty) {
      return const NetworkResponse.noAuth('Unauthorized');
    }

    final response = await executeRequest(
      dio,
      NetworkRequest(
        path: AppEndpoints.myWallet,
        type: NetworkRequestType.get,
        body: const NetworkRequestBody.empty(),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return response;
  }
}
