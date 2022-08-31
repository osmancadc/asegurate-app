import 'package:get/get.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class RegisterPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    print('Password: ${password}');
    print('Email:  ${email}');

    if (isvalidForm(
      email,
      password,
      name,
      lastname,
      phone,
      passwordConfirm,
    )) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando Datos...');
    }
  }

  void gotoRolesPage() {
    Get.offNamedUntil('/client/products/list', (route) => false);
  }

  bool isvalidForm(
    String email,
    String password,
    String name,
    String lastName,
    String phone,
    String confirmPassword,
  ) {
    if (email.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el Email');
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El Email no es Valido');
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar  Nombre');
    }
    if (lastName.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar Apellido');
    }
    if (phone.isEmpty) {
      Get.snackbar(
          'formulario no valido ', 'Debes ingresar Número de Teléfono');
    }
    if (email.isEmpty) {
      Get.snackbar('formulario no valido ', 'Debes ingresar el Email');
    }

    if (confirmPassword.isEmpty) {
      Get.snackbar(
          'formaulrio no valido', 'Debe Ingresar Confirmacion de Contraseña');
    }
    if (password != confirmPassword) {
      Get.snackbar('formulario no valido ', 'Las Contraseñas no coinciden');
    }

    if (imageFile == null) {
      Get.snackbar(
          'Formulario no valido', 'Debes Seleccionar una imagen de perfil');
    }

    return true;
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      },
      child: Text(
        'GALERIA',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
      child: Text(
        'CAMARA',
        style: TextStyle(color: Colors.black),
      ),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
