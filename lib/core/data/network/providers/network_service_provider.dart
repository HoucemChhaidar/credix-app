import 'package:credix_app/core/data/network/models/base_model.dart';
import 'package:credix_app/core/data/network/models/network_request.dart';
import 'package:credix_app/core/data/network/models/network_response.dart';
import 'package:credix_app/core/data/network/models/prepared_network_request.dart';
import 'package:dio/dio.dart';

mixin NetworkServiceProvider<T> {
  Future<NetworkResponse<Object>> executeRequest(
    Dio dio,
    NetworkRequest request, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final req = PreparedNetworkRequest(
      request,
      dio,
      request.headers,
      onSendProgress,
      onReceiveProgress,
    );
    final result = await execute(req);
    return result;
  }

  Future<NetworkResponse<Object>> execute(
    PreparedNetworkRequest preparedNetworkRequest,
  ) async {
    const extra = <String, dynamic>{};
    final dynamic body = preparedNetworkRequest.request.body.whenOrNull(
      json: (data) => data,
      formData: FormData.fromMap,
    );
    try {
      final result = await preparedNetworkRequest.dio.request<dynamic>(
        preparedNetworkRequest.request.path,
        data: body,
        queryParameters: preparedNetworkRequest.request.queryParams,
        options: Options(
          method: preparedNetworkRequest.request.type.name,
          headers: preparedNetworkRequest.request.headers,
          extra: extra,
        ),
      );
      if (T.runtimeType == BaseModel<dynamic, dynamic>) {
        return NetworkResponse.ok(
          BaseModel<dynamic, dynamic>.fromJson(result.data! as Map<String, dynamic>),
        );
      } else {
        return NetworkResponse.ok(
          BaseModel<dynamic, dynamic>.fromJson(result.data! as Map<String, dynamic>),
        );
      }
    } on DioException catch (error) {
      final errorText = error.toString();
      switch (error.response?.statusCode) {
        case 422:
          return NetworkResponse.badRequest(errorText);
        case 401:
          return NetworkResponse.noAuth(errorText);
        case 403:
          return NetworkResponse.noAccess(errorText);
        case 404:
          return NetworkResponse.notFound(errorText);
        case 409:
          return NetworkResponse.conflict(errorText);
        default:
          return NetworkResponse.noData(errorText);
      }
    } catch (error) {
      return NetworkResponse.noData(error.toString());
    }
  }
}
