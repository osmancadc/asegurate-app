import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_asegurate/models/user_get_id.dart';
import 'package:app_asegurate/providers/user_get_id_provider.dart';
import 'package:app_asegurate/utils.dart';

class ProfilePageController extends GetxController {
  RxString id = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString photo = "".obs;
  RxString document = "".obs;
  RxString gender = "empty".obs;

  UserByGetIdProviders userByGetIdProviders = UserByGetIdProviders();

  void getUserById(context) async {
    UserGetId userGetId =
        UserGetId(id: JwtDecoder.decode(GetStorage().read('token'))[id]);
    var response = await userByGetIdProviders.getUserById(userGetId);
    if (response.statusCode == 200) {
      gender.value = response.body['gender'];
      name.value = response.body['name'];
      email.value = response.body['email'];
      phone.value = response.body['phone'];
      photo.value = response.body['photo'];
      document.value = response.body['document'];
    }
    if (response.statusCode == 500) {
      showDialog(
          context: context,
          builder: getContext(response.body['message'], true));
    }
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
