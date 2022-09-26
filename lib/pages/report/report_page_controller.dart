import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils.dart';

class ReportPageController extends GetxController {
  TextEditingController textIdentification = TextEditingController();
  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  bool isvalidForm(
    String textIdentification,
  ) {
    if (textIdentification.isEmpty || selectedRadio.value == "") {
      showSnackbar('Todos los campos son obligatorios');
      return false;
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
