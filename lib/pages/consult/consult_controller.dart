import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../utils.dart';

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
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        max: 100,
        msg: 'Cargando...',
      );
      GetScore getscore = GetScore(
        document: identification,
        type: selectedRadio.value,
      );
      print(getscore.toJson());

      Response response = await usersProvider.getScore(getscore);
      print(response.body);
      progressDialog.close();
      if (response.statusCode == 200) {
        Get.offAllNamed('/result');
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
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
      Get.snackbar('formulario no valido ',
          'Debes ingresar un numero de cedula o Celular',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (selectedRadio.value == "") {
      Get.snackbar('formulario no valido ', 'Debes seleccionar una opcion',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      print(selectedRadio.value);
      return false;
    }

    return true;
  }
} 
