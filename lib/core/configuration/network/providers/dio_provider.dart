import 'package:credix_app/core/configuration/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioProvider {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://172.16.0.74:2345',
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }
}
