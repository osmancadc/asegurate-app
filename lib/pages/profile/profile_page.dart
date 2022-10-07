import 'package:app_asegurate/pages/profile/profile_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final con = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    con.getUserById(context);
    return Obx(() => Scaffold(
          backgroundColor: firstColor,
          appBar: AppBar(
            backgroundColor: firstColor,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: fifthColor,
                  size: MediaQuery.of(context).size.width * 0.12,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: textTitle,
            titleSpacing: 0,
            centerTitle: true,
            toolbarHeight: 60.2,
            toolbarOpacity: 0.8,
          ),
          drawer: MenuDrawer().menuDrawer(context),
          body: SingleChildScrollView(
            child: Stack(children: [
              _profileBackgroundImage(context),
              Column(
                children: [
                  _profileUserPicture(context),
                  _userName(),
                  _userDocument(),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      _boxFormEmail(context),
                      _boxFormCellPhone(context),
                      _buttonProfileEdit(context),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
  }

  Widget _profileBackgroundImage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.47,
      child: con.photo.value == ''
          ? Image.asset('assets/images/${con.gender.value}.png',
                  fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12)
          : Image.network(con.photo.value, fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12),
    );
  }

  Widget _profileUserPicture(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: CircleAvatar(
        backgroundImage: con.photo.value == ''
            ? AssetImage('assets/images/${con.gender.value}.png')
                as ImageProvider
            // ? AssetImage('assets/images/default_picture.png') as ImageProvider
            : NetworkImage(con.photo.value),
      ),
    );
  }

  Widget _userName() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        formatName(con.name.value),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _userDocument() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        formatDocument(con.document.value),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _profileSocialImage(BuildContext context, Image image) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Padding(padding: const EdgeInsets.all(7.0), child: image),
    );
  }

  Widget _boxFormEmail(context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 0,
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

  Widget _textIEmailAddress(context) {
    return Container(
      color: secondColor,
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
      color: secondColor,
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

  Widget _buttonProfileEdit(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: ElevatedButton(
        onPressed: () => gotoProfilePageEdit(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: thirdColor,
          padding: EdgeInsets.symmetric(vertical: 8),
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
