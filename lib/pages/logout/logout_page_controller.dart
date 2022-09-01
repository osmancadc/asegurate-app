import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:get/get.dart';

class LogoutPageController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void getOut(BuildContext context) async {
    String user = userController.text.trim();
    String password = passwordController.text.trim();

    if (isvalidForm(
      user,
      password,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Cerrando Sesión...');
      Login login = Login(
        user: user,
        password: password,
      );

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
