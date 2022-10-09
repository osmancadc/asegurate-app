import 'package:app_asegurate/api/authentication_api.dart';
import 'package:app_asegurate/models/person.dart';
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
  final dateController = TextEditingController().obs;
  final _authenticationApi = GetIt.instance<AuthenticationApi>();

  bool agreeTermsAndConditions = false;
  RxBool hidePassword = true.obs;
  RxString selectedRadio = "".obs;

  Future<void> register(BuildContext context) async {
    String document = identificationController.text.trim();
    String dateControllers = dateController.value.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if (validateForm(
        document, dateControllers, email, phone, password, passwordConfirm, selectedRadio.value)) {
      await LoadingDialog.show(context);
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
          ResultDialog.show(context,
              'La cuenta de ${formatName(response.data!)} ha sido creada con exito', false);
          Get.offAllNamed('/login');
          break;
        default:
          ResultDialog.show(context, response.errorMessage, true);
      }
    }
  }

  bool validateForm(String document, String dateControllers, String email, String phone,
      String password, String confirmPassword, String role) {
    if (document.isEmpty ||
        dateControllers.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        selectedRadio.value.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showSnackbar('Todos los campos son obligatorios', true);
      return false;
    }

    if (validateDocument(document) != null) {
      showSnackbar('Ingresa un número de cédula válido', true);
      return false;
    }

    if (validateEmail(email) != null) {
      showSnackbar('Ingresa un correo electronico válido', true);
      return false;
    }

    if (validatePhone(phone) != null) {
      showSnackbar('Ingresa un número de celular válido', true);
      return false;
    }

    if (validatePassword(password) != null) {
      showSnackbar('La contraseña debe tener al menos una mayúscula y un caracter especial', true);
      return false;
    }

    if (validateMatchingPasswords(confirmPassword) != null) {
      showSnackbar('Las contraseñas no coinciden', true);
      return false;
    }

    return true;
  }

  String? validateMatchingPasswords(String? value) {
    return value! == passwordController.text ? null : "Las contraseñas no coinciden";
  }
}
