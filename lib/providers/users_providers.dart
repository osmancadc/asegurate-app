import 'package:app_asegurate/models/models.dart';
import "package:get_storage/get_storage.dart";
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect {
  String requestUrl = Environment.BASE_URL;

  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  Future<Response> create(User user) async {
    Response response = await post(
      '$requestUrl/create-user',
      user.toJson(),
    );

    return response;
  }

  Future<Response> login(Login login) async {
    Response response = await post(
      '$requestUrl/authenticate-user',
      login.toJson(),
    );

    return response;
  }

  Future<Response> getScore(GetScore getScore) async {
    Response response = await post(
      '$requestUrl/get-score',
      getScore.toJson(),
    );

    return response;
  }
}
