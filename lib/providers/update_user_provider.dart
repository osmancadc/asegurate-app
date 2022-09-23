import 'package:app_asegurate/enviroment/enviroment.dart';
import "package:get_storage/get_storage.dart";
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../models/user_model.dart';
import 'dart:convert';
import 'dart:io';

class UpdateUserProvider extends GetConnect {
  String url = Environment.BASE_URL;

  String token = GetStorage().read('token') ?? "";

  Map<String, dynamic> decodedToken =
      JwtDecoder.decode(GetStorage().read('token'));

Future<Response> updateUser(User user) async {
    Response response = await put(
      '$url/user/profile/${decodedToken['id']}',
      user.toJson(),
    );

    return response;
  }


  Future<Stream> updateWithImage(User user, File image) async {
    final request = http.MultipartRequest(
        'PUT', Uri.parse('$url/update-user/${decodedToken['id']}'));
    request.files.add(http.MultipartFile(
        'image', image.readAsBytes().asStream(), image.lengthSync(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }
}
