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
  String _imageName = '';
  bool alreadyLoaded = false;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final _imagePicker = ImagePicker();

  void updateInfo(BuildContext context) async {
    final email = emailController.text;
    final phone = phoneController.text;
    final _accountApi = GetIt.instance<AccountApi>();
    final _accountClient = GetIt.instance<AccountClient>();

    if (validateForm(email, phone)) {
      temporalAvatar = '';
      LoadingDialog.show(context);
      final updateResponse =
          await _accountApi.updateUser(_imageBase64, _imageName, user!.document, email, phone);
      LoadingDialog.dismiss(context);

      switch (updateResponse.statusCode) {
        case 200:
          showSnackbar('El usuario ha sido actualizado correctamente', false);
          _accountClient.removeUser();
          Get.offAllNamed('/profile');
          break;
        default:
          ResultDialog.show(context, updateResponse.errorMessage, true);
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
      _imageName = pickedFile.name;

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

    if (validatePhone(phone) != null) {
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
