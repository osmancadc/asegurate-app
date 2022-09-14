import 'dart:io';
import 'package:app_asegurate/models/models.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import "package:get_storage/get_storage.dart";
import 'package:http/http.dart' as http;
import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:http/http.dart' as http;

class QualifyProviders extends GetConnect {
  String url = Environment.BASE_URL;

  Future<Response> uploadScore(UploadScore uploadScore) async {
    Response response = await post(
      '$url/upload-score',
      uploadScore.toJson(),
    );

    return response;
  }
}
