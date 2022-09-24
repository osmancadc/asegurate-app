import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class RegisterPageController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController identificationController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  var obscureText = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  UsersProvider usersProvider = UsersProvider();
  String encryptionKey = Environment.ENCRYPTION_KEY;
  _encrypt(String text) {
    final key = encrypt.Key.fromUtf8(encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  var date = DateTime.now().obs;
  var dateController = TextEditingController().obs;
  var selectedRadio = "".obs;
  onChangedRadio(var value) {
    selectedRadio.value = value;
  }

  void register(BuildContext context) async {
    String document = identificationController.text.trim();
    String dateControllers = dateController.value.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if (isvalidForm(
      document,
      dateControllers,
      email,
      phone,
      password,
      passwordConfirm,
      selectedRadio.value,
    )) {
      User user2 = User(
        document: document,
        expeditionDate: dateController.value.text,
        email: email,
        phone: phone,
        password: _encrypt(password),
        role: selectedRadio.value,
      );

      Response response = await usersProvider.create(user2);

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
          Get.offAllNamed('/login');
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
    String document,
    String dateControllers,
    String email,
    String phone,
    String password,
    String confirmPassword,
    String role,
  ) {
    if (document.isEmpty ||
        dateControllers.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        selectedRadio.value == "") {
      Get.snackbar('Formulario no válido ', 'Debes llenar todos los campos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (document.contains(RegExp(r'[a-zA-Z]')) ||
        document.length < 8 ||
        document.length > 10) {
      Get.snackbar(
          'Formulario no válido ', 'Debes ingresar un número de cédula válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (!email.contains(RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$'))) {
      Get.snackbar('Formulario no válido ',
          'Debes ingresar un correo electrónico válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (!phone.contains(RegExp(r'3[0-9]{9}'))) {
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

    if (!password.contains(RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'))) {
      Get.snackbar('Formulario no válido ',
          'La contraseña debe tener al menos una mayúscula, una minúscula y un caracter especial',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    if (confirmPassword == '' || password != confirmPassword) {
      Get.snackbar('Formulario no válido ', 'Las contraseñas no coinciden',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      return false;
    }

    return true;
  }

  String? validatePassword(String value) {
    if (!value.isNotEmpty) {
      return null;
    }

    if (value.length < 8) {
      return "La contraseña debe tener minimo 8 caracteres";
    }
    if (!value.contains(RegExp(r'.[A-Z].'))) {
      return "La contraseña debe tener al menos una Mayuscula";
    }

    if (!value.contains(RegExp(r'.[a-z].'))) {
      return "La contraseña debe tener al menos una Minuscula";
    }

    if (!value.contains(RegExp(r'.[0-9].'))) {
      return "La contraseña debe tener al menos un numero";
    }
    if (!value.contains(RegExp(r'.[a-z].'))) {
      return "La contraseña debe tener al menos una Minuscula";
    }

    return null;
  }

  String? validateMatchingPasswords(String value1, String value2) {
    return value1 == value2 ? null : "Las contraseñas no coinciden";
  }
}
