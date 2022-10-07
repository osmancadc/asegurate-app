import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/user_get_id.dart';

class UserByGetIdProviders extends GetConnect {
  String requestUrl = Environment.BASE_URL;

  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  Future<Response> getUserById(UserGetId userGetId) async {
    final token = await _authenticationClient.accessToken;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    Response response = await get(
      '$requestUrl/user/profile/${decodedToken['id']}',
    );

    return response;
  }
}
