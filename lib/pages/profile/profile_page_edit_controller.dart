import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import "package:get_storage/get_storage.dart";
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../models/user_model.dart';
import '../../providers/providers.dart';
import '../../providers/update_user_provider.dart';
import 'profile_page_controller.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

Map<String, dynamic> decodedToken =
    JwtDecoder.decode(GetStorage().read('token'));
final nameToken = decodedToken['name'];

class ProfilePageEditController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  File? image;
  UpdateUserProvider updateUserProvider = UpdateUserProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  ProfilePageController profilePageController = Get.find();

  ProfilePageEditController() {
    emailController.text = profilePageController.email.value;
    phoneController.text = profilePageController.phone.value;
    documentController.text = profilePageController.document.value;
  }

  void updateInfo(BuildContext context) async {
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String document = documentController.text.trim();
    if (isValidForm(email, phone, document)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
        max: 100,
        msg: 'Actualizando...',
      );
      User user = User(
        email: email,
        phone: phone,
        document: document,
      );
      if (imageFile == null) {
        await updateUserProvider.updateUser(user);
      } else {
        await updateUserProvider.updateWithImage(user, imageFile!);
      }

      progressDialog.close();
      final con = Get.put(ProfilePageController());
      con.getUserById(context);
      Get.back();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      child: Text('Galería'),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
        update();
      },
    );
    Widget cameraButton = ElevatedButton(
      child: Text('Cámara'),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
    );
    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opción'),
      content: Text('Selecciona una opción'),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  bool isValidForm(String email, String phone, String document) {
    if (document.isEmpty || email.isEmpty || phone.isEmpty) {
      Get.snackbar('Error', 'Todos los campos son obligatorios');
      return false;
    }
    if (document.length < 8 || document.length > 12) {
      Get.snackbar('Error', 'El documento debe tener entre 8 y 12 caracteres',
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
    return true;
  }
}
