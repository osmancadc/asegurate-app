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
  TextEditingController identificationController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
    String document = identificationController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
    print('user: $user');
    print('name: $name');
    print('lastname: $lastname');
    print('document: $document');
    print('email: $email');
    print('phone: $phone');
    print('Confirm Password: ${passwordConfirm}');
    print('Password: ${password}');
    print('Email:  ${user}');

    if (isvalidForm(
      user,
      document,
      name,
      lastname,
      email,
      phone,
      password,
      passwordConfirm,
      selectedRadio.value,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        max: 100,
        msg: 'Registrando...',
      );
      User user2 = User(
        username: user,
        document: document,
        name: name,
        lastname: lastname,
        email: email,
        phone: phone,
        password: _encrypt(password),
        role: selectedRadio.value,
      );
print(user2.toJson());
      Response response = await usersProvider.create(user2);

      progressDialog.close();
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Registro ok'),
              content: Text('Usuario registrado correctamente'),
            );
          },
        );
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed('/logout');
        });

        print(response.body);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(response.statusText!),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Ok'),
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
    String document,
    String name,
    String lastName,
    String email,
    String phone,
    String password,
    String confirmPassword,
    String role,
  ) {
    if (user.isEmpty) {
      Get.snackbar(
          'formulario no valido ', 'Debes Agregar un nombre de Usuario',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (document.isEmpty) {
      Get.snackbar(
          'formulario no valido ', 'Debes ingresar el numero de cedula',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (document.contains(RegExp(r'[a-zA-Z]'))) {
      Get.snackbar(
          'formulario no valido ', 'Debes ingresar un numero de cedula valido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el nombre',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (lastName.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el apellido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el correo',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (!email.contains('@') ||
        !email.contains('.') ||
        email.length < 6 ||
        email.length > 50) {
      Get.snackbar('formulario no valido ', 'Debes ingresar un email valido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el telefono',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (phone.length < 10 ||
        phone.length > 10 ||
        !phone.startsWith('3') ||
        phone.contains(RegExp(r'[a-zA-Z]')) ||
        !phone.contains(RegExp(r'[0-9]'))) {
      Get.snackbar('formulario no valido ', 'Debes ingresar  telefono valido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (password == '') {
      Get.snackbar('formulario no valido ', 'Debes ingresar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        password.length < 8) {
      Get.snackbar('formulario no valido ',
          'la Contraseña debe tener al menos 8 caracteres, 1 mayuscula  1 numero y 1 caracter especial',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (confirmPassword == '') {
      Get.snackbar('formulario no valido ', 'Debes confirmar la contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('formulario no valido ', 'Las contraseñas no coinciden',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
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
}
