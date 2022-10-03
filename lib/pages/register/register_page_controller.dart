import 'package:app_asegurate/enviroment/enviroment.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:app_asegurate/utils.dart';

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
  bool agreeTermsAndConditions = false;
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
            builder: getContext(
                'La cuenta de ${formatName(response.body['name'])} \nha sido creada con exito',
                false));

        Future.delayed(Duration(seconds: 2), () => Get.offAllNamed('/login'));
      } else {
        showDialog(
            context: context,
            builder: getContext(formatName(response.body['message']), true));
      }
    }
  }

  void gotoLoginPage() {
    Get.offNamedUntil('/logout', (route) => false);
  }

  void changeTermsAndConditionsState(bool? state) {
    agreeTermsAndConditions = state ?? false;
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
        selectedRadio.value == "" ||
        password == '') {
      showSnackbar('Todos los campos son obligatorios');
      return false;
    }

    if (!document.contains(RegExp(r'^[0-9]{8,10}$'))) {
      showSnackbar('Ingresa un número de cédula válido');
      return false;
    }

    if (!email.contains(RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$'))) {
      showSnackbar('Ingresa un correo electronico válido');
      return false;
    }

    if (!phone.contains(RegExp(r'3[0-9]{9}'))) {
      showSnackbar('Ingresa un número de celular válido');
      return false;
    }

    if (!password.contains(RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'))) {
      showSnackbar(
          'La contraseña debe tener al menos una mayúscula y un caracter especial');
      return false;
    }

    if (password != confirmPassword) {
      showSnackbar('Las contraseñas no coinciden');
      return false;
    }

    return true;
  }

  String? validateEmail(String? value) {
    if (value!.isNotEmpty &&
        !value.contains(RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$'))) {
      return 'Ingresa un correo electronico válido';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value!.isNotEmpty && !RegExp(r'3[0-9]{9}').hasMatch(value)) {
      return 'Ingresa un número de celular válido';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (!value!.isNotEmpty) {
      return "Ingresa una contraseña";
    }

    if (value.length < 8) {
      return "La contraseña debe tener minimo 8 caracteres";
    }
    if (!value.contains(RegExp(r'.*[A-Z].*'))) {
      return "La contraseña debe tener al menos una Mayuscula";
    }

    if (!value.contains(RegExp(r'.*[a-z].*'))) {
      return "La contraseña debe tener al menos una minuscula";
    }

    if (!value.contains(RegExp(r'.*[0-9].*'))) {
      return "La contraseña debe tener al menos un numero";
    }
    if (!value.contains(RegExp(r'.*[@$!%*?&].*'))) {
      return "La contraseña debe tener minimo uno de los \nsiguientes caracteres especiales @ \$ ! % * ? &";
    }

    return null;
  }

  String? validateMatchingPasswords(String? value) {
    return value! == passwordController.text
        ? null
        : "Las contraseñas no coinciden";
  }
}
