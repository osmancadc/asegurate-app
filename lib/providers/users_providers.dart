import 'dart:convert';
import 'package:app_asegurate/models/models.dart';
import 'dart:io';
import 'package:path/path.dart';
import "package:get_storage/get_storage.dart";
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends GetConnect {
  String url = Environment.BASE_URL;

  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  Future<Response> create(User user) async {
    Response response = await post(
      '$url/create-user',
      user.toJson(),
      // headers: {
      //   'content-type': 'application/json',
      // },
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    return response;
  }

  Future<Response> login(Login login) async {
    print("==========================================================");
    print(url);
    print("==========================================================");
    Response response = await post(
      '$url/authenticate-user',
      login.toJson(),

      // headers: {
      //   'content-type': 'application/json',
      // },
   
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    print('Response: ${response.body}');
    return response;
  }
}
