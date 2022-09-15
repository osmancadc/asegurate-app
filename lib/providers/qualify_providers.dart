import 'package:app_asegurate/models/models.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/enviroment/enviroment.dart';

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
