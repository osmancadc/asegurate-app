import 'package:app_asegurate/enviroment/enviroment.dart';
import "package:get_storage/get_storage.dart";
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/user_get_id.dart';

class UserByGetIdProviders extends GetConnect {
  String requestUrl = Environment.BASE_URL;
  String token = GetStorage().read('token') ?? "";

  Map<String, dynamic> decodedToken =
      JwtDecoder.decode(GetStorage().read('token'));

  Future<Response> getUserById(UserGetId userGetId) async {
    Response response = await get(
      '$requestUrl/user/profile/${decodedToken['id']}',
    );

    return response;
  }
}
