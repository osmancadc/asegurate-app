import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

class QualifyController extends GetxController {
  TextEditingController valueController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  QualifyProviders qualifyProviders = QualifyProviders();
  int score = 0;
  var typeRadio = "".obs;

  var author = JwtDecoder.decode(GetStorage().read('token'))['id'];

  onChangedRadio(var value) {
    typeRadio.value = value;
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
                  size: MediaQuery.of(context).size.width * 0.15,
                  color: Colors.redAccent.shade400,
                ),
                const SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    isValid[1],
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

  List isValidForm(
    String document,
    String type,
    String comments,
  ) {
    if (document.isEmpty || type.isEmpty || comments.isEmpty) {
      return [
        false,
        '''Debes llenar todos
        los campos'''
      ];
    }

    if (!document.contains(RegExp(r'^[0-9]{8,10}$'))) {
      return [
        false,
        '''El campo de
cedula o celular 
no es válido'''
      ];
    }

    return [true, ""];
  }

  void clear() {
    valueController.clear();
    nameController.clear();
    commentsController.clear();
  }
}
