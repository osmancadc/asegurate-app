import 'package:app_asegurate/pages/profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils.dart';

class ProfilePageEdit extends StatelessWidget {
  ProfilePageEdit({Key? key}) : super(key: key);

  final con = Get.put(ProfilePageEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorFontIcon,
            size: MediaQuery.of(context).size.width * 0.12,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: textTitle,
        titleSpacing: 00.3,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              _imageUser(context),
              _profileName(),
              _profileCityCountryText(),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _profileSocialImage(
                          context, Image.asset('assets/images/instagram.png')),
                      _profileSocialImage(
                          context, Image.asset('assets/images/facebook.png')),
                      _profileSocialImage(
                          context, Image.asset('assets/images/twitter.png')),
                    ],
                  ),
                  _boxFormEmail(context),
                  _boxFormCellPhone(context),
                  _buttonProfileEdit(context)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxFormEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [_textIEmailAddress(context)],
      ),
    );
  }

  Widget _boxFormCellPhone(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [_textCellPhone(context)],
      ),
    );
  }

  Widget _textIEmailAddress(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Correo Electrónico',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        validator: (value) => con.validateEmail(value),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }

  Widget _textCellPhone(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Número de Celular *',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        autovalidateMode: AutovalidateMode.always,
        validator: (value) => con.validatePhone(value),
      ),
    );
  }

  Widget _profileSocialImage(BuildContext context, Image image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Padding(padding: const EdgeInsets.all(5.0), child: image),
    );
  }

  Widget _profileCityCountryText() {
    return Text(
      'Bogotá, Colombia',
      style: TextStyle(
        color: colorFont,
        fontSize: 15,
      ),
    );
  }

  Widget _profileName() {
    return Text(
      nameToken,
      style: TextStyle(
        color: colorFont,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buttonProfileEdit(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ElevatedButton(
        onPressed: () => con.updateInfo(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Confirmar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.29,
      child: GestureDetector(
          onTap: () => con.showAlertDialog(context),
          child: GetBuilder<ProfilePageEditController>(
            builder: (value) => Container(
              margin: EdgeInsets.only(top: 20, left: 70, right: 70, bottom: 0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: con.imageFile == null
                  ? Image.asset(
                      'assets/images/no_image.png',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    )
                  : Image.file(
                      con.imageFile!,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
            ),
          )),
    );
  }
}