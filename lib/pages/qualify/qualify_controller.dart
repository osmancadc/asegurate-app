import 'package:app_asegurate/api/person_api.dart';
import 'package:app_asegurate/models/score.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class QualifyController extends GetxController {
  int scoreValue = 60;
  RxString typeRadio = "".obs;

  final valueController = TextEditingController();
  final nameController = TextEditingController();
  final commentsController = TextEditingController();
  final _personApi = GetIt.instance<PersonApi>();

  void upload(BuildContext context) async {
    if (validateForm()) {
      Score score = Score(
        type: typeRadio.value,
        value: valueController.text,
        score: scoreValue,
        comments: commentsController.text,
      );
      LoadingDialog.show(context);
      final response = await _personApi.uploadScore(score);

      switch (response.statusCode) {
        case 200:
          LoadingDialog.dismiss(context);
          ResultDialog.show(context, 'La calificación ha sido enviada con exito', false);
          clear();
          break;
        case 500:
          ResultDialog.show(context, response.errorMessage, true);
          break;
      }
    }
  }

  bool validateForm() {
    final value = valueController.text;
    final comments = commentsController.text;
    final type = typeRadio.value;

    if (value.isEmpty || comments.isEmpty) {
      showSnackbar('Debes llenar todos los campos', true);
      return false;
    }

    if (type.isEmpty) {
      showSnackbar('Debes seleccionar si es cédula o número de celular', true);
      return false;
    }

    if (type == "CC") {
      if (validateDocument(value) != null) {
        showSnackbar('Debes ingresar un número de cédula válido', true);
        return false;
      }
    } else if (type == "PHONE") {
      if (validatePhone(value) != null) {
        showSnackbar('Ingresa un número de celular válido', true);
        return false;
      }
    }

    return true;
  }

  void getFullName() async {
    final response = await _personApi.getPersonName(typeRadio.value, valueController.text);

    switch (response.statusCode) {
      case 200:
        nameController.text = formatName(response.data!);
        break;
      case 500:
        nameController.text = response.errorMessage;
        break;
    }
  }

  void clear() {
    valueController.clear();
    nameController.clear();
    commentsController.clear();
    typeRadio.value = "";
  }
}
