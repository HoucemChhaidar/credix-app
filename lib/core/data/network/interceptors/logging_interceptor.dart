import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      levelColors: {
        Level.debug: const AnsiColor.fg(81),
        Level.info: const AnsiColor.fg(191),
        Level.error: const AnsiColor.fg(203),
      },
    ),
  );

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _logger.d('''
🌐 𝗥𝗘𝗤𝗨𝗘𝗦𝗧 𝗦𝗘𝗡𝗧
├─ 🔗 𝗨𝗥𝗟: ${options.uri}
├─ 📡 𝗠𝗘𝗧𝗛𝗢𝗗: ${options.method.toUpperCase()}
├─ 📋 𝗛𝗘𝗔𝗗𝗘𝗥𝗦: ${_compactPrint(options.headers)}
├─ 🔍 𝗤𝗨𝗘𝗥𝗬: ${_compactPrint(options.queryParameters)}
└─ 📦 𝗗𝗔𝗧𝗔: ${_compactPrint(options.data)}''');
    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.i('''
✅ 𝗥𝗘𝗦𝗣𝗢𝗡𝗦𝗘 𝗥𝗘𝗖𝗘𝗜𝗩𝗘𝗗
├─ 🔗 𝗨𝗥𝗟: ${response.realUri}
├─ 🎯 𝗦𝗧𝗔𝗧𝗨𝗦: ${response.statusCode} ${_statusEmoji(response.statusCode)}
└─ 📦 𝗗𝗔𝗧𝗔: ${_compactPrint(response.data)}''');
    super.onResponse(response, handler);
  }

  @override
  FutureOr<dynamic> onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('''
❌ 𝗘𝗥𝗥𝗢𝗥 𝗢𝗖𝗖𝗨𝗥𝗥𝗘𝗗
├─ 🔗 𝗨𝗥𝗟: ${err.requestOptions.uri}
├─ 🚩 𝗦𝗧𝗔𝗧𝗨𝗦: ${err.response?.statusCode ?? 'N/A'} ${_statusEmoji(err.response?.statusCode)}
├─ 📜 𝗠𝗘𝗦𝗦𝗔𝗚𝗘: ${err.message}
└─ 📄 𝗥𝗘𝗦𝗣𝗢𝗡𝗦𝗘: ${_compactPrint(err.response?.data)}''');
    super.onError(err, handler);
  }

  String _compactPrint(dynamic data) {
    if (data == null) return '∅';
    if (data is Map || data is List) {
      return data.toString().replaceAll('\n', '').replaceAll(RegExp(r'\s{2,}'), ' ');
    }
    return data.toString();
  }

  String _statusEmoji(int? code) {
    if (code == null) return '❓';
    return switch (code) {
      >= 200 && < 300 => '🟢',
      400 => '🟠',
      401 => '🔐',
      403 => '🚫',
      404 => '🔍',
      >= 400 && < 500 => '🟡',
      >= 500 => '🔴',
      _ => '⚪',
    };
  }
}
