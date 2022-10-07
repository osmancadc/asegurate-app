import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

class QualifyController extends GetxController {
  TextEditingController valueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  QualifyProviders qualifyProviders = QualifyProviders();
  int score = 60;
  var typeRadio = "".obs;
  var author = JwtDecoder.decode(GetStorage().read('token'))['id'];

  void getFullName() async {
    Response response = await qualifyProviders.getFullName(
        valueController.text, typeRadio.value);

    switch (response.statusCode) {
      case 200:
        {
          nameController.text = formatName(response.body["name"]);
        }
        break;
      case 500:
        {
          nameController.text = response.body["message"];
        }
        break;
    }
  }

  void onChangedRadio(var value) {
    typeRadio.value = value;
    getFullName();
  }

  void onChangedScore(double score) {
    this.score = (score * 20).round();
  }

  void upload(BuildContext context) async {
    String value = valueController.text.trim();
    String comments = commentsController.text.trim();

    var isValid = isValidForm(value, typeRadio.value, comments);

    if (isValid[0]) {
      UploadScore uploadScore = UploadScore(
        author: author,
        type: typeRadio.value,
        value: value,
        score: score,
        comments: comments,
      );
      Response response = await qualifyProviders.uploadScore(uploadScore);
      switch (response.statusCode) {
        case 200:
          {
            ResultDialog.show(
                context, 'La calificación ha sido enviada con exito', false);

            Future.delayed(Duration(seconds: 1), () {
              clear();
            });
          }
          break;
        case 500:
          {
            ResultDialog.show(context, response.body['message'], true);
          }
          break;
      }
    } else {
      showSnackbar(isValid[1]);
    }
  }

  List isValidForm(
    String value,
    String type,
    String comments,
  ) {
    if (value.isEmpty || comments.isEmpty) {
      return [false, 'Debes llenar todos los campos'];
    }

    if (type.isEmpty) {
      return [false, 'Debes seleccionar si es cédula o número de celular'];
    }

    if (type == "CC") {
      if (!value.contains(RegExp(r'^[0-9]{8,10}$'))) {
        return [false, 'Debes ingresar un número de cédula o celular válido'];
      }
    } else if (type == "PHONE") {
      if (!RegExp(r'3[0-9]{9}').hasMatch(value)) {
        return [false, 'Ingresa un número de celular válido'];
      }
    }

    return [true, ''];
  }

  String? validateDocument(String? value) {
    if (value!.isNotEmpty && !RegExp(r'^[0-9]{8,10}$').hasMatch(value)) {
      return 'Debes ingresar un número de cédula o celular válido';
    }
    return null;
  }

  void clear() {
    valueController.clear();
    nameController.clear();
    commentsController.clear();
    typeRadio.value = "";
  }
}
