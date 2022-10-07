import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  // final _authenticationApi = AuthenticationApi();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final usersProvider = UsersProvider();
  final _authenticationApi = GetIt.instance<AuthenticationApi>();
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  var obscureText = true.obs;
  void authenticateUser(BuildContext context) async {
    String username = userController.text.trim();
    String password = passwordController.text.trim();

    if (validateForm(username, password)) {
      User user = User(
        document: username,
        password: encryptText(password),
      );

      final response = await _authenticationApi.login(user);
      switch (response.statusCode) {
        case 200:
          await _authenticationClient.saveSession(response.data);
          Get.offAllNamed('/profile');
          break;
        default:
          ResultDialog.show(context, 'Usuario o contraseña incorrectos', true);
      }
    }
  }

  bool validateForm(String user, String password) {
    if (user.isEmpty) {
      userController.text = '';
      userController.selection = TextSelection.fromPosition(
        const TextPosition(
          offset: 0,
        ),
      );
      return false;
    } else if (password.isEmpty) {
      passwordController.text = '';
      passwordController.selection = TextSelection.fromPosition(
        const TextPosition(
          offset: 0,
        ),
      );
      return false;
    }
    return true;
  }

  logout() {
    //TODO REPLACE FOR SECURE REMOVAL OF THE DATA
    GetStorage().remove('token');
    GetStorage().remove('user');
    Get.offAllNamed('/login');
  }
}
