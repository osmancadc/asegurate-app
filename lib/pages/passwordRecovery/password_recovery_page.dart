import 'package:app_asegurate/pages/passwordRecovery/password_recovery_controller.dart';
import 'package:flutter/material.dart';

import 'package:app_asegurate/utils/utils.dart';
import 'package:get/get.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

  Widget _formBox(context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        _textFieldDocument(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _buttonRecoverPassword(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        _buttonReturn(context),
      ],
    );
  }

  Widget _textFieldDocument(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          keyboardType: TextInputType.number,
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

  Widget _buttonRecoverPassword(BuildContext context) {
    PasswordRecoveryController con = Get.put(PasswordRecoveryController());
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          con.sendRecoveryEmail(context);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: thirdColor,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Recuperar contraseña',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buttonReturn(BuildContext context) {
    PasswordRecoveryController con = Get.put(PasswordRecoveryController());
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 95, vertical: 0),
      child: ElevatedButton(
        onPressed: () => con.gotoLoginPage(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: Colors.grey.shade600,
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
        child: const Text(
          'Regresar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
