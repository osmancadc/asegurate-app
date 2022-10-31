import 'package:app_asegurate/api/person_api.dart';
import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/models/score.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class QualifyController extends GetxController {
  int scoreValue = 60;
  RxString typeRadio = "".obs;

  final objectiveController = TextEditingController();
  final nameController = TextEditingController();
  final commentsController = TextEditingController();
  final _personApi = GetIt.instance<PersonApi>();

  void upload(BuildContext context) async {
    final isValid = await validateForm();
    if (isValid) {
      Score score = Score(
        type: typeRadio.value,
        objective: objectiveController.text,
        score: scoreValue,
        comments: commentsController.text,
      );
      LoadingDialog.show(context);
      final response = await _personApi.uploadScore(score);

      LoadingDialog.dismiss(context);
      switch (response.statusCode) {
        case 200:
          ResultDialog.show(context, 'La calificación ha sido enviada con exito', false);
          clear();
          break;
        case 500:
          ResultDialog.show(context, response.errorMessage, true);
          break;
      }
    }
  }

  Future<bool> validateForm() async {
    final _value = objectiveController.text;
    final _comments = commentsController.text;
    final _type = typeRadio.value;
    final _name = nameController.text;
    final _authenticationClient = GetIt.instance<AuthenticationClient>();
    final _author = await _authenticationClient.getUserId();

    if (_value.isEmpty || _comments.isEmpty) {
      showSnackbar('Debes llenar todos los campos', true);
      return false;
    }

    if (_type.isEmpty) {
      showSnackbar('Debes seleccionar si es cédula o número de celular', true);
      return false;
    }

    if (_name.isEmpty) {
      showSnackbar('¡No tan rápido tiro al blanco!', true);
      return false;
    }

    if (_name == 'el usuario no se pudo encontrar' && _type == 'PHONE') {
      showSnackbar('No hay ninguna persona asociada a ese número de celular', true);
      return false;
    }

    if (_name == 'el usuario no se pudo encontrar' && _type == 'CC') {
      showSnackbar('Ingresa un número de identificación real', true);
      return false;
    }

    if (_author == _value) {
      showSnackbar('No te puedes calificar a ti mismo', true);
      return false;
    }

    if (_type == "CC") {
      if (validateDocument(_value) != null) {
        showSnackbar('Debes ingresar un número de cédula válido', true);
        return false;
      }
    } else if (_type == "PHONE") {
      if (validatePhone(_value) != null) {
        showSnackbar('Ingresa un número de celular válido', true);
        return false;
      }
    }

    return true;
  }

  void getFullName() async {
    final response = await _personApi.getPersonName(typeRadio.value, objectiveController.text);

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
    objectiveController.clear();
    nameController.clear();
    commentsController.clear();
    typeRadio.value = "";
  }
}
