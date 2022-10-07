import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';

abstract class DependencyInjection {
  static void initialize() {
    final baseUrl = Environment.BASE_URL;

    final Dio dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    Logger logger = Logger();

    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: true,
    );

    final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    final AuthenticationApi authenticationApi = AuthenticationApi(http);
    final AuthenticationClient authenticationClient =
        AuthenticationClient(secureStorage);

    GetIt.instance.registerSingleton<AuthenticationApi>(authenticationApi);
    GetIt.instance
        .registerSingleton<AuthenticationClient>(authenticationClient);
  }
}
