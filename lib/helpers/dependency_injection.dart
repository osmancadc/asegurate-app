import 'package:app_asegurate/api/account_api.dart';
import 'package:app_asegurate/api/person_api.dart';
import 'package:app_asegurate/data/account_client.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/data/authentication_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class DependencyInjection {
  static void initialize() {
    final baseUrl = Environment.BASE_URL;

    final Dio dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    Logger logger = Logger();

    Http _http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: false,
    );

    final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

    final AuthenticationClient authenticationClient = AuthenticationClient(_secureStorage);
    final AuthenticationApi authenticationApi = AuthenticationApi(_http);
    final AccountApi accountApi = AccountApi(_http);
    final PersonApi personApi = PersonApi(_http);
    final AccountClient accountClient = AccountClient(_secureStorage);

    GetIt.instance.registerSingleton<AuthenticationApi>(authenticationApi);
    GetIt.instance.registerSingleton<AuthenticationClient>(authenticationClient);
    GetIt.instance.registerSingleton<AccountClient>(accountClient);
    GetIt.instance.registerSingleton(accountApi);
    GetIt.instance.registerSingleton(personApi);
  }
}
