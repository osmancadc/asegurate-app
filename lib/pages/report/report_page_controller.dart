import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPageController extends GetxController {
  TextEditingController textIdentification = TextEditingController();
  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  bool isvalidForm(
    String textIdentification,
  ) {
    if (textIdentification.isEmpty) {
      Get.snackbar('Formulario no válido',
          'Debes ingresar un número de documento o celular',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (selectedRadio.value == "") {
      Get.snackbar('Formulario no válido ', 'Debes seleccionar una opción',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }

    return true;
  }
}

void register(BuildContext context) async {
  String textIdentification =
      Get.find<ReportPageController>().textIdentification.text;
  if (Get.find<ReportPageController>().isvalidForm(textIdentification)) {
    Get.find<ReportPageController>().selectedRadio.value;
    Get.find<ReportPageController>().textIdentification.text;
    Get.find<ReportPageController>().textIdentification.clear();
    Get.back();
  }
}
