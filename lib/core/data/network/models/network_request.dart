import 'package:credix_app/core/data/network/models/network_request_body.dart';

enum NetworkRequestType { get, post, put, delete }

class NetworkRequest {
  NetworkRequest({
    required this.path,
    required this.type,
    required this.body,
    this.headers = const {},
    this.queryParams,
  });

  final String path;
  final Map<String, dynamic> headers;
  final Map<String, dynamic>? queryParams;
  final NetworkRequestBody body;
  final NetworkRequestType type;
}
