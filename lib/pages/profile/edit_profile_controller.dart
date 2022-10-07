import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import "package:get_storage/get_storage.dart";
import 'package:jwt_decoder/jwt_decoder.dart';
import 'profile_controller.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:app_asegurate/models/person.dart';
import 'package:app_asegurate/providers/update_user_provider.dart';

Map<String, dynamic> decodedToken =
    JwtDecoder.decode(GetStorage().read('token'));
final nameToken = formatName(decodedToken['name']);

class ProfilePageEditController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
  }

  void updateInfo(BuildContext context) async {
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    if (isValidForm(email, phone)) {
      Person user = Person(
        email: email,
        phone: phone,
      );
      if (imageFile == null) {
        await updateUserProvider.updateUser(user);
      } else {
        await updateUserProvider.updateWithImage(user, imageFile!);
      }

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

  bool isValidForm(String email, String phone) {
    if (email.isEmpty || phone.isEmpty) {
      showSnackbar('Todos los campos son obligatorios');
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
}
