import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';

@freezed
class NetworkResponse<BaseModel> with _$NetworkResponse<dynamic> {
  const factory NetworkResponse.ok(BaseModel data) = _Ok;

  const factory NetworkResponse.badRequest(String message) = _BadRequest;

  const factory NetworkResponse.noAuth(String message) = _NoAuth;

  const factory NetworkResponse.noAccess(String message) = _NoAccess;

  const factory NetworkResponse.invalidParameters(String message) = _InvalidParameters;

  const factory NetworkResponse.notFound(String message) = _NotFound;

  const factory NetworkResponse.conflict(String message) = _Conflict;

  const factory NetworkResponse.noData(String message) = _NoData;
}
