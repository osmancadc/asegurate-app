import 'package:app_asegurate/helpers/http_response.dart';
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

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    required T Function(dynamic data) parser,
  }) async {
    try {
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

      return HttpResponse.success<T>(response.statusCode!, parser(response.data));
    } catch (e) {
      if (_logsEnabled) {
        _logger.e(e);
      }

      int statusCode = 0;
      String message = '';

      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          statusCode = e.response!.statusCode ?? -1;
          message = e.response!.data['message'] ?? e.message;
        }
      }

      return HttpResponse.fail(
        statuscode: statusCode,
        message: message,
      );
    }
  }
}
