import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:get_it/get_it.dart';
import "package:get_storage/get_storage.dart";
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../models/person.dart';
import 'dart:convert';
import 'dart:io';

class UpdateUserProvider extends GetConnect {
  String requestUrl = Environment.BASE_URL;

  String token = GetStorage().read('token') ?? "";

  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  Future<Response> updateUser(Person person) async {
    final decodedToken = await _authenticationClient.getUserInformation();
    Response response = await put(
      '$requestUrl/user/profile/${decodedToken!['id']}',
      person.toJson(),
    );

    return response;
  }

  Future<Stream> updateWithImage(Person person, File image) async {
    final decodedToken = await _authenticationClient.getUserInformation();
    final request = http.MultipartRequest(
        'PUT', Uri.parse('$requestUrl/update-user/${decodedToken!['id']}'));
    request.files.add(http.MultipartFile(
        'image', image.readAsBytes().asStream(), image.lengthSync(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(person);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }
}
