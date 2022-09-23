import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePageController extends GetxController {
  String tokenStorage = GetStorage().read('token');

  //  Map<String, dynamic> decodedToken = JwtDecoder.decode(GetStorage().read('token'));


  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var photo = "".obs;
  var document = "".obs;

  @override
  void onInit() async {
    super.onInit();
    // name.value = decodedToken['name'];
    // email.value = decodedToken['email'];
    // phone.value = decodedToken['phone'];
    // photo.value = decodedToken['photo'];
    // document.value = decodedToken['document'];
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
