import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';

class ConsultController extends GetxController {
  TextEditingController textIdentification = TextEditingController();

  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  UsersProvider usersProvider = UsersProvider();

  consult(BuildContext context) async {
    String identification = textIdentification.text.trim();
    if (isvalidForm(identification, selectedRadio.value)) {
      GetScore getscore = GetScore(
        value: identification,
        type: selectedRadio.value,
      );

      Response response = await usersProvider.getScore(getscore);

      if (response.statusCode == 200) {
        Get.offAllNamed('/consultDetail', arguments: response.body);
      } else {
        ResultDialog.show(context, response.body['message'], true);
      }
    }
  }

  bool isvalidForm(
    String textIdentification,
    String value,
  ) {
    if (textIdentification.isEmpty || selectedRadio.value == "") {
      showSnackbar('Todos los campos son obligatorios');

      return false;
    }
    return true;
  }
}
