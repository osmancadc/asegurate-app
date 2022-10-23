import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/helpers/http_response.dart';
import 'package:app_asegurate/models/update_response.dart';
import 'package:app_asegurate/models/user.dart';
import 'package:get_it/get_it.dart';

class AccountApi {
  final Http _http;

  AccountApi(this._http);

  Future<HttpResponse<User>> getUserInfo() async {
    final _authenticationClient = GetIt.instance<AuthenticationClient>();
    final userId = await _authenticationClient.getUserId();

    return _http.request<User>(
      '/user/profile/$userId',
      method: 'GET',
      parser: (data) => User.fromJson(data),
    );
  }

  Future<HttpResponse<UpdateResponse>> updateUser(
      String imageBase64, String imageName, String document, String email, String phone) async {
    return _http.request<UpdateResponse>(
      '/user/update-user',
      method: 'POST',
      data: {
        'image': imageBase64,
        'name': imageName,
        'document': document,
        'email': email,
        'phone': phone,
      },
      parser: (data) => UpdateResponse.fromJson(data),
    );
  }
}
