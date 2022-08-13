import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class QualifyController extends GetxController {
  TextEditingController textIdentification = TextEditingController();
  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  bool isvalidForm(
    String textIdentification,
  ) {
    if (textIdentification.isEmpty) {
      Get.snackbar('formulario no valido ',
          'Debes ingresar un numero de cedula o Celular',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (selectedRadio.value == "") {
      Get.snackbar('formulario no valido ', 'Debes seleccionar una opcion',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      print(selectedRadio.value);
    }

    return true;
  }
}

void register(BuildContext context) async {
  String textIdentification =
      Get.find<QualifyController>().textIdentification.text;
  if (Get.find<QualifyController>().isvalidForm(textIdentification)) {
    Get.find<QualifyController>().selectedRadio.value;
    Get.find<QualifyController>().textIdentification.text;
    Get.find<QualifyController>().textIdentification.clear();
    Get.back();

    print('formulario valido' +
        textIdentification +
        ' ' +
        Get.find<QualifyController>().selectedRadio.value);
  }
}
