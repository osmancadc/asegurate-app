import 'package:app_asegurate/pages/login/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_asegurate/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        backgroundColor: firstColor,
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
    return Column(
      children: [
        _boxFormUser(context),
        _boxFormPassword(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _buttonEnter(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _buttonRegister(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _recoverPassword(context),
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

  Widget _boxFormUser(BuildContext context) {
    LoginController con = Get.put(LoginController());
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[],
      ),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05, left: 30, right: 30, bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: con.userController,
          decoration: const InputDecoration(
            labelText: 'Número de documento',
            labelStyle: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxFormPassword(BuildContext context) {
    LoginController con = Get.put(LoginController());
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
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
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.73,
          ),
          child: TextButton(
            onPressed: () => con.obscureText.value = !con.obscureText.value,
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Icon(
              con.obscureText.value ? Icons.visibility_off : Icons.visibility,
              color: firstColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonEnter(BuildContext context) {
    LoginController con = Get.put(LoginController());
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () => con.authenticateUser(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: thirdColor,
          padding: EdgeInsets.symmetric(vertical: 8),
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

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 95, vertical: 4),
      child: ElevatedButton(
        onPressed: () => Get.toNamed('/register'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: Colors.grey.shade600,
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

  Widget _recoverPassword(context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/passwordRecovery'),
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
                color: fifthColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
