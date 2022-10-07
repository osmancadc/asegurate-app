import 'package:app_asegurate/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:app_asegurate/models/user_model.dart';
import 'package:app_asegurate/models/person.dart';

class AuthenticationApi {
  final Http _http;

  AuthenticationApi(this._http);

  Future<Response> register(Person person) {
    return _http.request(
      '/create-user',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: person.toJson(),
    );
  }

  Future<Response> login(User user) async {
    return _http.request(
      '/authenticate-user',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: user.toJson(),
    );
  }
}
