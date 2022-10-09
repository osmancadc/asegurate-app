import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/helpers/http_response.dart';
import 'package:app_asegurate/models/avatar_response.dart';
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

  Future<HttpResponse<User>> updateUserInfo(String email, String phone) async {
    final _authenticationClient = GetIt.instance<AuthenticationClient>();
    final userId = await _authenticationClient.getUserId();

    return _http.request<User>(
      '/user/profile/$userId',
      method: 'GET',
      parser: (data) => User.fromJson(data),
    );
  }

  Future<HttpResponse<AvatarResponse>> updateAvatar(String imageBase64) async {
    return _http.request<AvatarResponse>(
      '/user/update-avatar',
      method: 'POST',
      data: {
        'avatar': imageBase64,
      },
      parser: (data) => AvatarResponse.fromJson(data),
    );
  }
}
