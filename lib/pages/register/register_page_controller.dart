import 'package:get/get.dart';


class RegisterPageController extends GetxController {

  var selectedRadio = "".obs;
  var selectedRadioIdentification = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }
  
  onChangedRadioIdentification(var value2) {
    selectedRadioIdentification.value = value2;
  }
}

