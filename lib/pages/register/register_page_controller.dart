import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../utils.dart';

class RegisterPageController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController identificationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UsersProvider usersProvider = UsersProvider();
  String ENCRYPTION_KEY = Environment.ENCRYPTION_KEY;
  _encrypt(String text) {
    final key = encrypt.Key.fromUtf8(ENCRYPTION_KEY);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  void register(BuildContext context) async {
    String user = userController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String identification = identificationController.text.trim();
    String password = passwordController.text;
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String passwordConfirm = passwordConfirmController.text;

    print('Confirm Password: ${passwordConfirm}');
    print('Password: ${password}');
    print('Email:  ${user}');
    bool isvalidForm(
      String user,
      String name,
      String lastName,
      String identification,
      String email,
      String phone,
      String password,
      String confirmPassword,
    ) {
      if (user.isEmpty ||
          name.isEmpty ||
          lastName.isEmpty ||
          identification.isEmpty ||
          email.isEmpty ||
          phone.isEmpty ||
          password.isEmpty ||
          password != confirmPassword ||
          confirmPassword.isEmpty) {
        Get.snackbar('formulario no valido ',
            'Todos los datos son requeridos para el registro',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        return false;
      }

      // if (password != confirmPassword) {
      //   Get.snackbar('formulario no valido ', 'Las contraseñas no coinciden',
      //       snackPosition: SnackPosition.BOTTOM,
      //       backgroundColor: Colors.green,
      //       colorText: Colors.white);
      //   return false;
      // }
      if (selectedRadio.value == "") {
        Get.snackbar('formulario no valido ', 'Debes seleccionar una opcion',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        print(selectedRadio.value);
        return false;
      }

      return true;
    }

    if (isvalidForm(
      user,
      password,
      name,
      lastname,
      email,
      phone,
      identification,
      passwordConfirm,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      User user2 = User(
        username: user,
        name: name,
        role: selectedRadio.value,
        lastname: lastname,
        email: email,
        phone: phone,
        document: identification,
        password: _encrypt(password),
      );
      print(user2.toJson());
      Response response = await usersProvider.create(user2);

      progressDialog.close();
      if (response.statusCode == 200) {
        Get.offAllNamed('/logout');
        print(response.body);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(response.statusText!),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void gotoLoginPage() {
    Get.offNamedUntil('/logout', (route) => false);
  }
}
