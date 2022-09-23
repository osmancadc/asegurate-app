import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/user_get_id.dart';
import '../../providers/user_get_id_provider.dart';

class ProfilePageController extends GetxController {
  var id = "".obs;
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var photo = "".obs;
  var document = "".obs;
  UserByGetIdProviders userByGetIdProviders = UserByGetIdProviders();

 void  getUserById() async {
    UserGetId userGetId =
        UserGetId(id: JwtDecoder.decode(GetStorage().read('token'))[id]);
    var response = await userByGetIdProviders.getUserById(userGetId);
    if (response.statusCode == 200) {
      name.value = response.body['name'];
      email.value = response.body['email'];
      phone.value = response.body['phone'];
      photo.value = response.body['photo'];
      document.value = response.body['document'];
    }
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
