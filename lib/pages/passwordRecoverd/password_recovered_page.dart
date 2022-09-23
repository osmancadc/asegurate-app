import 'package:flutter/material.dart';

import '../../utils.dart';

class PasswordRecoveredPage extends StatelessWidget {
  const PasswordRecoveredPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
    );
  }

  Widget _formBox(context) {
    return Column(
      children: [
        _boxFormSendEmail(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        _textFieldSendEmail(context),
        _buttomSendEmail(context)
      ],
    );
  }

  Widget _boxFormSendEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        children: [
          _textSendEmail(context),
        ],
      ),
    );
  }

  Widget _textFieldSendEmail(context) {
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
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Número de documento',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textSendEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Text(
        "Le hemos enviado un correo electrónico con un enlace para restablecer su contraseña",
        style: TextStyle(
          color: colorFont,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buttomSendEmail(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Enviar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
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
