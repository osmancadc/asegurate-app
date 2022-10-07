import 'dart:convert';

import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_asegurate/models/user_get_id.dart';
import 'package:app_asegurate/providers/user_get_id_provider.dart';

class ProfilePageController extends GetxController {
  RxString id = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString photo = "".obs;
  RxString document = "".obs;
  RxString gender = "empty".obs;
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  UserByGetIdProviders userByGetIdProviders = UserByGetIdProviders();

  void getUserById(context) async {
    final tokenDecoded = await _authenticationClient.getUserInformation();

    UserGetId userGetId = UserGetId(id: tokenDecoded![id]);
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
      ResultDialog.show(context, response.body['message'], true);
    }
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
