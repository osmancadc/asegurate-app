import 'package:app_asegurate/models/models.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';

class QualifyProviders extends GetConnect {
  String requestUrl = Environment.BASE_URL;

  Future<Response> uploadScore(UploadScore uploadScore) async {
    return await post(
      '$requestUrl/upload-score',
      uploadScore.toJson(),
    );
  }

  Future<Response> getFullName(String value, type) async {
    return await get(
      '$requestUrl/user/$type/$value',
    );
  }
}
