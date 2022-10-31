import 'package:app_asegurate/api/account_api.dart';
import 'package:app_asegurate/data/account_client.dart';
import 'package:app_asegurate/models/user.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ProfilePageController extends GetxController {
  RxString id = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString photo = "".obs;
  RxString document = "".obs;
  RxString role = "".obs;
  RxString gender = "empty".obs;

  void getUserInformation(context) async {
    final _accountApi = GetIt.instance<AccountApi>();
    final _accountClient = GetIt.instance<AccountClient>();

    User? savedUser = await _accountClient.userData;
    if (savedUser == null) {
      final response = await _accountApi.getUserInfo();

      switch (response.statusCode) {
        case 200:
          savedUser = response.data;
          await _accountClient.saveUser(savedUser!);
          break;
        case 401:
          ResultDialog.show(context, 'Usuario no autorizado', true);
          break;
        default:
          ResultDialog.show(context, response.errorMessage, true);
      }
    }
    if (savedUser != null) {
      gender.value = savedUser.gender;
      photo.value = savedUser.photo;
      name.value = savedUser.name;
      email.value = savedUser.email;
      phone.value = savedUser.phone;
      document.value = savedUser.document;
      role.value = (savedUser.role == 'seller') ? 'Vendedor' : 'Comprador';
    }
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/editProfile');
}
