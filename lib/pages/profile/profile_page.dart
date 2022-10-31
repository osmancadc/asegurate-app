import 'package:app_asegurate/pages/profile/profile_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:app_tutorial/app_tutorial.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final con = Get.put(ProfilePageController());
  List<TutorialItems> items = [];

  GlobalKey dataKey = GlobalKey();
  GlobalKey emailKey = GlobalKey();
  GlobalKey phoneKey = GlobalKey();
  GlobalKey buttonKey = GlobalKey();
  GlobalKey menuKey = GlobalKey();

  @override
  void initState() {
    Color backgroundColor = Colors.black26.withOpacity(0.8);

    items.addAll({
      TutorialItems(
        globalKey: dataKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            "Este es tu perfil, acá podrás ver tu información personal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: emailKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Este es el correo electrónico asociado a tu cuenta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          'Toque para continuar',
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: phoneKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        children: [
          Text(
            'Este es el número de celular asociado a tu cuenta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          )
        ],
        shapeFocus: ShapeFocus.square,
        widgetNext: Text(
          'Toque para continuar',
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: buttonKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Si deseas editar tu perfil, lo puedes hacer presionando este botón',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 200,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      TutorialItems(
        globalKey: menuKey,
        touchScreen: true,
        bottom: 50,
        left: 25,
        color: backgroundColor,
        borderRadius: Radius.circular(25.0),
        shapeFocus: ShapeFocus.square,
        children: [
          Text(
            'Aquí encontrarás el menú donde puedes acceder a todas las funcionalidades que ofrece la aplicación',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 200,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: thirdColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Tutorial.showTutorial(context, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    con.getUserInformation(context);

    return Obx(() => Scaffold(
          backgroundColor: firstColor,
          appBar: AppBar(
            backgroundColor: firstColor,
            leading: Builder(
              builder: (context) => IconButton(
                key: menuKey,
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
                  _userAvatar(context),
                  _userName(),
                  _userDocument(),
                  _userRole(),
                  SizedBox(height: 40),
                  _boxFormEmail(context),
                  _boxFormCellPhone(context),
                  _buttonProfileEdit(context),
                ],
              ),
            ]),
          ),
        ));
  }

  Widget _profileBackgroundImage(BuildContext context) {
    return SizedBox(
      key: dataKey,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.47,
      child: con.photo.value == ''
          ? Image.asset('assets/images/${con.gender.value}.png', fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12)
          : Image.network(con.photo.value, fit: BoxFit.cover)
              .blurred(colorOpacity: 0.7, blur: 8, blurColor: Colors.black12),
    );
  }

  Widget _userAvatar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: CircleAvatar(
        backgroundImage: con.photo.value == ''
            ? AssetImage('assets/images/${con.gender.value}.png') as ImageProvider
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

  Widget _userRole() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        con.role.value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _boxFormEmail(context) {
    return Container(
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
      key: emailKey,
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
      key: phoneKey,
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
        key: buttonKey,
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
