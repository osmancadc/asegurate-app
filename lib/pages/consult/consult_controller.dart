import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error' + response.statusCode.toString()),
              content: Text(response.statusText!),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Cerrar'),
                  onPressed: () {
                    Navigator.of(context).pop();
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
    String textIdentification,
    String value,
  ) {
    if (textIdentification.isEmpty) {
      Get.snackbar('Formulario no válido ', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (selectedRadio.value == "") {
      Get.snackbar('Formulario no válido ', 'Debes seleccionar una opción',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    return true;
  }
}
