import 'package:app_asegurate/api/person_api.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:get_it/get_it.dart';

class ConsultController extends GetxController {
  final identificationValue = TextEditingController();
  final _personApi = GetIt.instance<PersonApi>();
  RxString selectedRadio = "".obs;

  consult(BuildContext context) async {
    if (validateForm()) {
      LoadingDialog.show(context);
      final response = await _personApi.searchPerson(
        identificationValue.text,
        selectedRadio.value,
      );
      LoadingDialog.dismiss(context);

      switch (response.statusCode) {
        case 200:
          Get.offAllNamed('/searchResult', arguments: response.data);
          break;
        case 401:
          ResultDialog.show(context, 'Usuario no autorizado', true);
          break;
        default:
          ResultDialog.show(context, 'Usuario no encontrado', true);
      }
    }
  }

  String? validateInput(String? value) {
    if (value!.isNotEmpty && !value.contains(RegExp(r'^[0-9]{8,10}$'))) {
      return 'Ingresa un número de identificación válido';
    }
    return null;
  }

  bool validateForm() {
    if (identificationValue.text.isEmpty || selectedRadio.value.isEmpty) {
      showSnackbar('Todos los campos son obligatorios', true);
      return false;
    }

    if (validateInput(identificationValue.text) != null) {
      showSnackbar('Ingresa un número de identificación válido', true);
      return false;
    }

    return true;
  }
}
