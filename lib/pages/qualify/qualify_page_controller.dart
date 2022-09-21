import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class QualifyController extends GetxController {
  TextEditingController documentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController scoreController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  QualifyProviders qualifyProviders = QualifyProviders();
var valueSliderScore = 0.0.obs;
  var selectedRadio = "".obs;

  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  void upload(BuildContext context) async {
    String document = documentController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String comments = commentsController.text.trim();

    if (isValidForm(
      document,
      selectedRadio.value,
      name,
      lastName,
     valueSliderScore.value.toInt(), 
      comments,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        max: 100,
        msg: 'Calificando...',
      );
      UploadScore uploadScore = UploadScore(
        document: document,
        type: selectedRadio.value,
        name: name,
        lastName: lastName,
        score: valueSliderScore.value.toInt(),
        comments: comments,
        
      );

      Response response = await qualifyProviders.uploadScore(uploadScore);
      progressDialog.close();
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: MediaQuery.of(context).size.width * 0.18,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '''Tu calificación ha 
sido enviada con éxito''',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
        Future.delayed(Duration(seconds: 2), () {
          clear();
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.error,
                  size: MediaQuery.of(context).size.width * 0.18,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '''Debes llenar todos 
los campos''',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  bool isValidForm(
    String document,
    String type,
    String name,
    String lastName,
    int score,
    String comments,
  ) {
    if (document.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes agregar un documento de identidad',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (document.contains(RegExp(r'[^0-9]'))) {
      Get.snackbar(
          'Formulario no válido ', 'El documento de identidad no es válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (type.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes seleccionar un tipo de documento',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (name.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes agregar un nombre de Usuario',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (lastName.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes agregar un apellido de Usuario',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (comments.isEmpty) {
      Get.snackbar('Formulario no válido ', 'Debes agregar un comentario',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (type.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes agregar un tipo de documento',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    return true;
  }

  void clear() {
    documentController.clear();
    nameController.clear();
    lastNameController.clear();
    scoreController.clear();
    commentsController.clear();
  }
}
