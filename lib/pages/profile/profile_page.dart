import 'package:app_asegurate/pages/profile/profile_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePageController con = Get.put(ProfilePageController());
  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
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
          _profileBackgroundImage(context),
          _profileShapeImage(context),
          Column(
            children: [
              _profileCircleImage(context),
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
                  _boxFormIdentification(context),
                  _buttomProfileEdit(context)
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _boxFormIdentification(context) {
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
        children: [_textIdentification(context)],
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

  Widget _boxFormEmail(context) {
    return Container(
      width: double.infinity,
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

  Widget _textIEmailAddress(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Correo Electrónico',
        ),
      ),
    );
  }

  Widget _textCellPhone(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Numero de Celular',
        ),
      ),
    );
  }

  Widget _textIdentification(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Numero de Identificación',
        ),
      ),
    );
  }

  Widget _profileSocialImage(BuildContext context, Image image) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Padding(padding: const EdgeInsets.all(5.0), child: image),
    );
  }

  Widget _profileCityCountryText() {
    return Container(
      child: Text(
        'Bogotá, Colombia',
        style: TextStyle(
          color: colorFont,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _profileName() {
    return Container(
      child: Text(
        'Jhon Doe',
        style: TextStyle(
          color: colorFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _profileCircleImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 70, right: 70, bottom: 0),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.35,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }

  Widget _profileShapeImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 20.0,
            spreadRadius: 5.0)
      ]),
    );
  }

  Widget _profileBackgroundImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Hero(
        tag: 'profile',
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
        ),
      ),
    );
  }

  Widget _buttomProfileEdit(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: ElevatedButton(
        onPressed: () => gotoProfilePageEdit(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Editar  Perfil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
