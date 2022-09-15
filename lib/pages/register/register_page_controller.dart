import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:sn_progress_dialog/sn_progress_dialog.dart';

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

      Response response = await usersProvider.create(user2);

      progressDialog.close();
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text('Usuario registrado correctamente',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                  textAlign: TextAlign.center),
            );
          },
        );
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed('/logout');
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(response.statusText!,
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                  textAlign: TextAlign.center),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text(
                    'Ok',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
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
          'Formulario no válido ', 'Debes agregar un nombre de usuario',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (document.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes ingresar un número de cédula',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (document.contains(RegExp(r'[a-zA-Z]'))) {
      Get.snackbar(
          'Formulario no válido ', 'Debes ingresar un número de cédula válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('Formulario no válido ', 'Debes ingresar un nombre',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (lastName.isEmpty) {
      Get.snackbar('Formulario no válido ', 'Debes ingresar un apellido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (email.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes ingresar un correo electrónico',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (!email.contains('@') ||
        !email.contains('.') ||
        email.length < 6 ||
        email.length > 50) {
      Get.snackbar('Formulario no válido ',
          'Debes ingresar un correo electrónico válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar(
          'Formulario no válido ', 'Debes ingresar un número de celular',
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
      Get.snackbar('Formulario no válido ', 'Debes ingresar un celular válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (password == '') {
      Get.snackbar('Formulario no válido ', 'Debes ingresar una contraseña',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        password.length < 8) {
      Get.snackbar('Formulario no válido ',
          'La contraseña debe tener mayúsculas, minúsculas y caracteres especiales',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (confirmPassword == '') {
      Get.snackbar('Formulario no válido ', 'Las contraseñas no coinciden',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('Formulario no válido ', 'Las contraseñas no coinciden',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }
    if (selectedRadio.value == "") {
      Get.snackbar('Formulario no válido ', 'Debes seleccionar una opción',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      return false;
    }

    return true;
  }
}
