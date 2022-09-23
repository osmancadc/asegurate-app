import 'package:app_asegurate/pages/profile/profile_page_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final con = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: colorSecondary,
          appBar: AppBar(
            backgroundColor: colorPrimary,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: colorFontIcon,
                  size: MediaQuery.of(context).size.width * 0.12,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: textTitle,
            titleSpacing: 00.3,
            centerTitle: true,
            toolbarHeight: 60.2,
            toolbarOpacity: 0.8,
          ),
          drawer: MenuDrawer().menuDrawer(context),
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
                          _profileSocialImage(context,
                              Image.asset('assets/images/instagram.png')),
                          _profileSocialImage(context,
                              Image.asset('assets/images/facebook.png')),
                          _profileSocialImage(context,
                              Image.asset('assets/images/twitter.png')),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      _boxFormEmail(context),
                      _boxFormCellPhone(context),
                      _boxFormIdentification(context),
                      _buttomProfileEdit(context),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
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
            blurRadius: 1,
            offset: Offset(0, 0.50),
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
            blurRadius: 1,
            offset: Offset(0, 0.50),
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
            blurRadius: 1,
            offset: Offset(0, 0.50),
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
      color: colorSecondary,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: Text(
          'Email: ' + con.email.value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _textCellPhone(context) {
    return Container(
      color: colorSecondary,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: Text(
          'Celular: ' + con.phone.value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _textIdentification(context) {
    return Container(
      color: colorSecondary,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: Text(
          'C.C. ' + con.document.value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
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
      con.name.value,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _profileCircleImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: CircleAvatar(
        backgroundImage: con.photo.value == ''
            ? const AssetImage('assets/images/no_image.png') as ImageProvider
            : NetworkImage(con.photo.value),
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
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.47,
      child: con.photo.value == ''
          ? Image.asset('assets/images/no_image.png', fit: BoxFit.cover)
              .blurred(blur: 5, blurColor: Colors.white, colorOpacity: 1)
          : Image.network(con.photo.value, fit: BoxFit.cover)
              .blurred(colorOpacity: 0.5, blur: 8, blurColor: Colors.black12),
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
