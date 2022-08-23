import 'package:app_asegurate/pages/register/register_page_controller.dart';
import 'package:app_asegurate/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPageController con = Get.put(RegisterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      body: Stack(
        children: [
          // _backgroundCover(context),
          _boxForm(context),
          _buttomBack(),
          Column(
            children: [
              _imageUser(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.24,
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _textFieldPassword(),
            _textFieldPasswordConfirm(),
            _buttomRegister(context),
          ],
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      color: colorSecondary,
    );
  }


  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
            onTap: () => con.showAlertDialog(context),
            child: GetBuilder<RegisterPageController>(
              builder: (value) => Container(
                margin:
                    EdgeInsets.only(top: 20, left: 70, right: 70, bottom: 0),
                height: MediaQuery.of(context).size.height * 0.15,
                child: con.imageFile == null
                    ? Image.asset(
                        'assets/images/no_image.png',
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                      )
                    : Image.file(
                        con.imageFile!,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
              ),
            )),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: Text(
        'INGRESA ESTA INFORMACION',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          prefixIcon: Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          prefixIcon: Icon(
            Icons.person_outline,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.passwordController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            color: colorSecondary,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPasswordConfirm() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        controller: con.passwordConfirmController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Confirmar Contraseña',
          prefixIcon: Icon(
            Icons.lock_outline,
          ),
        ),
      ),
    );
  }

  Widget _buttomRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        onPressed: () => con.register(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          primary: colorOnPrimaryVariant,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'REGISTRARSE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buttomBack() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
