import 'package:app_asegurate/pages/login/login_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        backgroundColor: colorSecondary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              _logoImage(context),
              _formBox(context),
            ],
          ),
        ),
      ),
    ));
  }

  _formBox(BuildContext context) {
    LoginPageController con = Get.put(LoginPageController());

    return Column(
      children: [
        _boxFormUser(context),
        _boxFormPassword(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _buttomEnter(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _buttomRegister(context),
        _recoverPassword(context),
      ],
    );
  }

  Widget _recoverPassword(context) {
    LoginPageController con = Get.put(LoginPageController());
    return GestureDetector(
      onTap: con.goToRecoverdPassword,
      child: Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                color: colorFont,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttomRegister(BuildContext context) {
    LoginPageController con = Get.put(LoginPageController());
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 95, vertical: 4),
      child: ElevatedButton(
        onPressed: () => con.gotoRegisterPage(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnSecondaryVariant,
          padding: EdgeInsets.symmetric(vertical: 4),
        ),
        child: const Text(
          'Registrarse',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buttomEnter(BuildContext context) {
    LoginPageController con = Get.put(LoginPageController());
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
    LoginPageController con = Get.put(LoginPageController());
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
          decoration: const InputDecoration(
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
    LoginPageController con = Get.put(LoginPageController());
    return Stack(
      children: [
        Container(
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
              obscureText: con.obscureText.value,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.015,
            left: MediaQuery.of(context).size.width * 0.73,
          ),
          child: TextButton(
            onPressed: con.toggle,
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Icon(
              con.obscureText.value ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _logoImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Image.asset(
        'assets/images/logo.png',
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
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
