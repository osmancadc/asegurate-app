import 'dart:convert';
import 'dart:io';
import 'package:app_asegurate/api/account_api.dart';
import 'package:app_asegurate/data/account_client.dart';
import 'package:app_asegurate/models/user.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:app_asegurate/utils/utils.dart';

class ProfilePageEditController extends GetxController {
  User? user;
  String temporalAvatar = '';
  String _imageBase64 = '';
  bool alreadyLoaded = false;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _imagePicker = ImagePicker();

  void updateInfo(BuildContext context) async {
    final email = emailController.text;
    final phone = phoneController.text;
    final _accountApi = GetIt.instance<AccountApi>();

    if (validateForm(email, phone)) {
      if (_imageBase64.isNotEmpty) {
        temporalAvatar = '';
        LoadingDialog.show(context);
        final responseAvatar = await _accountApi.updateAvatar(_imageBase64);
        // final responseInformation = await _accountApi.updateUserInfo(email, phone);

        switch (responseAvatar.statusCode) {
          case 200:
            showSnackbar('La imagen de perfil se ha actualizado correctamente', false);
            break;
          default:
            ResultDialog.show(context, responseAvatar.errorMessage, true);
        }
        LoadingDialog.dismiss(context);
      }
    }
  }

  Future<void> getUserInformation() async {
    if (alreadyLoaded) {
      return;
    }
    final _accountClient = GetIt.instance<AccountClient>();
    final userData = await _accountClient.userData;

    if (userData != null) {
      emailController.value = TextEditingValue(
        text: userData.email,
        selection: TextSelection.fromPosition(
          TextPosition(offset: userData.email.length),
        ),
      );
      phoneController.text = userData.phone;
      user = userData;
      alreadyLoaded = true;
    }
  }

  ImageProvider getAvatar() {
    if (temporalAvatar.isNotEmpty) {
      return FileImage(File(temporalAvatar));
    }

    if (user != null) {
      if (user!.photo != '') {
        return NetworkImage(user!.photo);
      }
      return AssetImage('assets/images/${user!.gender}.png');
    }
    return AssetImage('assets/images/empty.png');
  }

  void selectImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: imageSource);

    if (pickedFile != null) {
      Navigator.pop(context);
      final _imageBytes = await pickedFile.readAsBytes();
      _imageBase64 = base64.encode(_imageBytes);

      temporalAvatar = pickedFile.path;
      update();
    }
  }

  bool validateForm(String email, String phone) {
    if (email.isEmpty || phone.isEmpty) {
      showSnackbar('Todos los campos son obligatorios', true);
      return false;
    }

    if (validateEmail(email) != null) {
      showSnackbar('Ingresa un correo electronico válido', true);
      return false;
    }

    if (!phone.contains(RegExp(r'3[0-9]{9}'))) {
      showSnackbar('Ingresa un número de celular válido', true);
      return false;
    }

    return true;
  }

  Widget sourceSelector(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Selecciona foto de perfil",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera, color: firstColor),
                onPressed: () {
                  selectImage(ImageSource.camera, context);
                },
                label: Text("Cámara", style: TextStyle(color: firstColor)),
              ),
              TextButton.icon(
                icon: Icon(Icons.image, color: firstColor),
                onPressed: () {
                  selectImage(ImageSource.gallery, context);
                },
                label: Text("Galería", style: TextStyle(color: firstColor)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
