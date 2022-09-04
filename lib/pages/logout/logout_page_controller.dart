import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:get/get.dart';

class LogoutPageController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String ENCRYPTION_KEY = Environment.ENCRYPTION_KEY;

  _encrypt(String text) {
    final key = encrypt.Key.fromUtf8(ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  UsersProvider usersProvider = UsersProvider();
  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void getOut(BuildContext context) async {
    String username = userController.text.trim();
    String password = passwordController.text.trim();

    if (isvalidForm(
      username,
      password,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        max: 100,
        msg: 'Cargando...',
      );
      Login login = Login(
        username: username,
        password: _encrypt(password),
      );
      print(login.toJson());

      Response response = await usersProvider.login(login);
      progressDialog.close();
      if (response.statusCode == 200) {
        Get.offAllNamed('/menu');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(response.statusText!),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  bool isvalidForm(
    String user,
    String password,
  ) {
    if (user.isEmpty) {
      userController.text = '';
      userController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: 0,
        ),
      );
      return false;
    } else if (password.isEmpty) {
      passwordController.text = '';
      passwordController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: 0,
        ),
      );
      return false;
    }
    return true;
  }
}

void gotoInitiPage() {
  Get.toNamed('/');
}
