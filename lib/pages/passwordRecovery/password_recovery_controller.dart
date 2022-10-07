import 'package:app_asegurate/utils/dialogs.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryController extends GetxController {
  void sendRecoveryEmail(BuildContext context) {
    ResultDialog.show(
        context,
        'Hemos enviado un correo electronico a osma*****@hotmail.com con los pasos a seguir',
        false);
  }

  void gotoLoginPage() {
    Get.offNamedUntil('/login', (route) => false);
  }
}
