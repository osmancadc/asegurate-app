import 'package:app_asegurate/models/models.dart';
import "package:get_storage/get_storage.dart";
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UsersProvider extends GetConnect {
  String url = Environment.BASE_URL;

  User userSession = User.fromJson(GetStorage().read('user') ?? {});
  Future<Response> create(User user) async {
    Response response = await post(
      '$url/create-user',
      user.toJson(),
    );

    return response;
  }

  Future<Response> login(Login login) async {
    Response response = await post(
      '$url/authenticate-user',
      login.toJson(),
    );

    return response;
  }

  Future<Response> getScore(GetScore getScore) async {
    Response response = await post(
      '$url/get-score',
      getScore.toJson(),
    );

    return response;
  }


}
