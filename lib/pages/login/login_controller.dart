import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  // final _authenticationApi = AuthenticationApi();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final _authenticationApi = GetIt.instance<AuthenticationApi>();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  var obscureText = true.obs;
  void authenticateUser(BuildContext context) async {
    String document = userController.text.trim();
    String password = passwordController.text.trim();

    LoadingDialog.show(context);

    if (validateForm(document, password)) {
      final response = await _authenticationApi.login(document, password);
      LoadingDialog.dismiss(context);
      switch (response.statusCode) {
        case 200:
          await _authenticationClient.saveSession(response.data!);
          Get.offAllNamed('/profile');
          break;
        default:
          ResultDialog.show(context, 'Usuario o contraseña incorrectos', true);
      }
    }
  }

  bool validateForm(String document, String password) {
    if (document.isEmpty || password.isEmpty) {
      showSnackbar('Todos los campos son obligatorio', true);
      return false;
    }
    return true;
  }
}
