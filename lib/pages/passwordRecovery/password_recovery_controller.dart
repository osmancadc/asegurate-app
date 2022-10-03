import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:app_asegurate/utils.dart';

class PasswordRecoveryController extends GetxController {
  void sendRecoveryEmail(BuildContext context) {
    showDialog(
        context: context,
        builder: getContext(
            formatName(
                "Hemos enviado un correo electronico a osma*****@hotmail.com con los pasos a seguir"),
            false));
  }

  void gotoLoginPage() {
    Get.offNamedUntil('/logout', (route) => false);
  }
}
