import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class SettingsPageController extends GetxController {
  TextEditingController textIdentification = TextEditingController();
  var selectedRadio = "".obs;
  var selectedRadioIdentification = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  onChangedRadioIdentification(var value2) {
    selectedRadioIdentification.value = value2;
  }
}
