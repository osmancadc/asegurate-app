import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Http {
  late Dio _dio;
  late Logger _logger;
  late bool _logsEnabled;

  Http({
    required Dio dio,
    required Logger logger,
    required bool logsEnabled,
  }) {
    _dio = dio;
    _logger = logger;
    _logsEnabled = logsEnabled;
  }

  Future<Response> request(
    String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.request(
      path,
      options: Options(
        method: method,
        headers: headers,
      ),
      queryParameters: queryParameters,
      data: data,
    );

    if (_logsEnabled) {
      _logger.i(
          'The register returned a status of ${response.statusCode} and a body ${response.data}');
    }

    return response;
  }
}
