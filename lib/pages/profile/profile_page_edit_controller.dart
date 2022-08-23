import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfilePageEditController extends GetxController {
  ImagePicker picker = ImagePicker();
  File? imageFile;

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      child: Text('Galeria'),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
        update();
      },
    );
    Widget cameraButton = ElevatedButton(
      child: Text('Camara'),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
    );
    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      content: Text('Selecciona una opcion'),
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
}
