import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/models/models.dart';
import 'package:app_asegurate/providers/providers.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:get_it/get_it.dart';

class RegisterPageController extends GetxController {
  final userController = TextEditingController();
  final identificationController = TextEditingController();
  final lastNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final usersProvider = UsersProvider();
  final dateController = TextEditingController().obs;
  final _authenticationApi = GetIt.instance<AuthenticationApi>();

  bool agreeTermsAndConditions = false;
  RxBool hidePassword = true.obs;
  RxString selectedRadio = "".obs;

  void register(BuildContext context) async {
    String document = identificationController.text.trim();
    String dateControllers = dateController.value.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if (validateForm(document, dateControllers, email, phone, password,
        passwordConfirm, selectedRadio.value)) {
      LoadingDialog.show(context);

      final response = await _authenticationApi.register(
        Person(
          document: document,
          expeditionDate: dateController.value.text,
          email: email,
          phone: phone,
          password: encryptText(password),
          role: selectedRadio.value,
        ),
      );
      LoadingDialog.dismiss(context);

      switch (response.statusCode) {
        case 200:
          ResultDialog.show(
              context,
              'La cuenta de ${formatName(response.data['name'])} ha sido creada con exito',
              false);
          Get.offNamedUntil('/logout', (route) => false);
          break;
        default:
          ResultDialog.show(context, response.data['message'], true);
      }
    }
  }

  bool validateForm(String document, String dateControllers, String email,
      String phone, String password, String confirmPassword, String role) {
    if (document.isEmpty ||
        dateControllers.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        selectedRadio.value.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showSnackbar('Todos los campos son obligatorios');
      return false;
    }

    if (validateDocument(document) != null) {
      showSnackbar('Ingresa un número de cédula válido');
      return false;
    }

    if (validateEmail(email) != null) {
      showSnackbar('Ingresa un correo electronico válido');
      return false;
    }

    if (validatePhone(phone) != null) {
      showSnackbar('Ingresa un número de celular válido');
      return false;
    }

    if (validatePassword(password) != null) {
      showSnackbar(
          'La contraseña debe tener al menos una mayúscula y un caracter especial');
      return false;
    }

    if (validateMatchingPasswords(confirmPassword) != null) {
      showSnackbar('Las contraseñas no coinciden');
      return false;
    }

    return true;
  }

  String? validateDocument(String? value) {
    if (value!.isNotEmpty && !value.contains(RegExp(r'^[0-9]{8,10}$'))) {
      return 'Ingresa un documento válido';
    }
    return null;
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
      return null;
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
