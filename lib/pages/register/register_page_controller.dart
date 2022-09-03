import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';

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

  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  void register(BuildContext context) async {
    String user = userController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String identification = identificationController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
    print('Confirm Password: ${passwordConfirm}');
    print('Password: ${password}');
    print('Email:  ${user}');

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
      progressDialog.show(max: 100, msg: 'Registrando Datos...');
      User user2 = User(
        username: user,
        name: name,
        role: selectedRadio.value,
        lastname: lastname,
        email: email,
        phone: phone,
        document: identification,
        password: password,
      );

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
    if (user.isEmpty) {
      Get.snackbar('formulario no valido ',
          'Debes ingresar un numero de cedula o Celular',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (name.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el nombre',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (lastName.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el apellido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (email.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (phone.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el telefono',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (identification.isEmpty) {
      Get.snackbar(
          'formulario no valido ', 'Debes ingresar el numero de cedula',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (password.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (confirmPassword.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes confirmar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (password.toString() != confirmPassword.toString()) {
      Get.snackbar('formulario no valido ', 'Las contraseñas no coinciden',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
    if (selectedRadio.value == "") {
      Get.snackbar('formulario no valido ', 'Debes seleccionar una opcion',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      print(selectedRadio.value);
    }

    return true;
  }
}
