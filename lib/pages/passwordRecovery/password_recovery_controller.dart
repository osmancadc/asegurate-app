import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PasswordRecoveryController extends GetxController {
  final _authenticationApi = GetIt.instance<AuthenticationApi>();
  final documentController = TextEditingController();

  Future<void> sendRecoveryEmail(BuildContext context) async {
    final document = documentController.text;
    if (validateForm(document)) {
      final response = await _authenticationApi.recoverPassword(document);

      switch (response.statusCode) {
        case 200:
          ResultDialog.show(
              context,
              'Hemos enviado un correo electrónico a ' + response.data! + ' con los pasos a seguir',
              false);
          break;
        default:
          ResultDialog.show(
              context, 'No encontramos ninguna cuenta asociada a ese documento', true);
      }
    }
  }

  bool validateForm(String document) {
    if (validateDocument(document) != null) {
      showSnackbar('Ingresa un número de cédula válido', true);
      return false;
    }
    return true;
  }

  void gotoLoginPage() {
    Get.offNamedUntil('/login', (route) => false);
  }
}
