import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/user_get_id.dart';
import '../../providers/user_get_id_provider.dart';

class ProfilePageController extends GetxController {
  var id = "".obs;
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var photo = "".obs;
  var document = "".obs;
  UserByGetIdProviders userByGetIdProviders = UserByGetIdProviders();

  void getUserById(context) async {
    UserGetId userGetId =
        UserGetId(id: JwtDecoder.decode(GetStorage().read('token'))[id]);
    var response = await userByGetIdProviders.getUserById(userGetId);
    if (response.statusCode == 200) {
      name.value = response.body['name'];
      email.value = response.body['email'];
      phone.value = response.body['phone'];
      photo.value = response.body['photo'];
      document.value = response.body['document'];
    }
    if (response.statusCode == 500) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error' + response.body['message']),
            content: Text(response.statusText!),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  String formatName() {
    String formatedName = "";
    if (name.value.isEmpty) {
      return formatedName;
    }

    List<String> fullName = name.value.split(" ");

    for (String s in fullName) {
      formatedName += "${s[0]}${s.substring(1).toLowerCase()} ";
    }
    return formatedName;
  }

  String formatDocument() {
    if (document.value.isEmpty) {
      return "";
    }

    var f = NumberFormat("###,###,###,###", "en_US");

    return f.format(int.parse(document.value)).replaceAll(',', '.');
  }
}

void gotoProfilePageEdit(BuildContext context) async {
  Get.toNamed('/edit');
}
