import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePageController extends GetxController {
  String tokenStorage = GetStorage().read('token');

  //  Map<String, dynamic> decodedToken = JwtDecoder.decode(GetStorage().read('token'));
  Map<String, dynamic> decodedToken = JwtDecoder.decode(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJpZCI6MTIsIm5hbWUiOiJGcmVkeSBSaXZlcmEiLCJyb2xlIjoic2VsbGVyIiwiZW1haWwiOiJ5ZGVyZnJlQGdtYWlsLmNvbSIsInBob25lIjoiMzEwMzQ0NDAzOSIsImRvY3VtZW50IjoiNzk4MTA3MjUiLCJwaG90byI6Imh0dHBzOi8vd3d3Lnczc2Nob29scy5jb20vaG93dG8vaW1nX2F2YXRhci5wbmcifQ.Ju86J4Mt8GeFSssRMbVKFSvtw62JyrDBht0Kum3mMRY");

  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var photo = "".obs;
  var document = "".obs;

  @override
  void onInit() async {
    super.onInit();
    name.value = decodedToken['name'];
    email.value = decodedToken['email'];
    phone.value = decodedToken['phone'];
    photo.value = decodedToken['photo'];
    document.value = decodedToken['document'];
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
