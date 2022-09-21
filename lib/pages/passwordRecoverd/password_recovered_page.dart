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
        _buttomSendEmail(context),
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

  Widget _textSendEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Text(
        "We have sent you an email with a link to reset your password",
        style: TextStyle(
          color: colorPrimary,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buttomSendEmail(context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'ENVIAR',
          style: TextStyle(
            color: colorFont,
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
