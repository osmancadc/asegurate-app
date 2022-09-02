import 'package:app_asegurate/pages/logout/logout_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: textTitle,
        titleSpacing: 00.3,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _logoImage(context),
            _formBox(context),
          ],
        ),
      ),
    );
  }

  _formBox(BuildContext context) {
    return Column(
      children: [
        _boxFormUser(context),
        _boxFormPassword(context),
        _buttomEnter(context),
        _buttomRegister(context),
      ],
    );
  }

  Widget _buttomRegister(BuildContext context) {
    LogoutPageController con = Get.put(LogoutPageController());
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ElevatedButton(
        onPressed: () => con.gotoRegisterPage(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Registrarse',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _buttomEnter(BuildContext context) {
    LogoutPageController con = Get.put(LogoutPageController());
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ElevatedButton(
        onPressed: () => con.getOut(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _boxFormUser(BuildContext context) {
    LogoutPageController con = Get.put(LogoutPageController());
    return Container(
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
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 30,
          right: 30,
          bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: con.userController,
          decoration: InputDecoration(
            labelText: 'Usuario',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxFormPassword(BuildContext context) {
    LogoutPageController con = Get.put(LogoutPageController());
    return Container(
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
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: 20,
        left: 30,
        right: 30,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: con.passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxFormConfirmPassword(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        left: 30,
        right: 30,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirmar Contraseña',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoImage(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}
