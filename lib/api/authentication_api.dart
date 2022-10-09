import 'package:app_asegurate/models/authentication_response.dart';
import 'package:app_asegurate/models/person.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/helpers/http_response.dart';

class AuthenticationApi {
  final Http _http;

  AuthenticationApi(this._http);

  Future<HttpResponse<String>> register(Person person) {
    return _http.request(
      '/create-user',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: person.toJson(),
      parser: (data) => data['name'],
    );
  }

  Future<HttpResponse<AuthenticationResponse>> login(String document, String password) {
    password = encryptText(password);

    return _http.request<AuthenticationResponse>(
      '/authenticate-user',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: {
        'document': document,
        'password': password,
      },
      parser: (data) => AuthenticationResponse.fromJson(data),
    );
  }
}
