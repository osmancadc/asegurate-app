import 'package:app_asegurate/pages/register/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class RegisterPage extends StatelessWidget {
  RegisterPageController con = Get.put(RegisterPageController());
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: colorFontIcon,
            size: MediaQuery.of(context).size.width * 0.12,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: textTitle,
        titleSpacing: 00.3,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                  ),
                  _logoImage(context),
                  _boxFormUser(context),
                  _boxFormIdentification(context),
                  _boxFormRegisterNameLastname(context),
                  _boxFormRegisterEmail(context),
                  _boxFormRegisterPhone(context),
                  _boxFormPassword(context),
                  _boxFormConfirmPassword(context),
                  _radioButton(context),
                  _buttomRegister(context),
                  _buttomGetInto(context),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _radioButton(context) {
    RegisterPageController con = Get.put(RegisterPageController());
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Row(
        children: [
          Text(
            '''
            Cual es tu  
            Perfil Principal''',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: colorFont,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Obx(() => Radio(
                        value: "seller",
                        groupValue: con.selectedRadio.value,
                        onChanged: (value) {
                          con.onChangedRadio(value);
                        },
                        activeColor: Colors.blue.shade300,
                        fillColor: MaterialStateProperty.all(Colors.white),
                      )),
                  const Text(
                    'Vendedor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() => Radio(
                        value: "buyer",
                        groupValue: con.selectedRadio.value,
                        onChanged: (value) {
                          con.onChangedRadio(value);
                        },
                        activeColor: Colors.blue.shade300,
                        fillColor: MaterialStateProperty.all(Colors.white),
                      )),
                  const Text(
                    'Comprador',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logoImage(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }




    Widget   _boxFormRegisterPhone(context) {
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
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [
          _textFormRegisterPhone(context),
        ],
      ),
    );
  }
    Widget  _boxFormRegisterEmail(context) {
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
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [
          _textFormRegisterEmail(context),
        ],
      ),
    );
  }

  Widget _boxFormConfirmPassword(context) {
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
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [
          _textConfirmPassword(context),
        ],
      ),
    );
  }

  Widget _boxFormPassword(context) {
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
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [
          _textPassword(context),
        ],
      ),
    );
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
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        children: [_textIdentification(context)],
      ),
    );
  }
}

Widget _boxFormUser(context) {
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
          blurRadius: 15,
          offset: Offset(0, 0.75),
        ),
      ],
    ),
    child: Column(
      children: [_textUser(context)],
    ),
  );
}

Widget _boxFormRegisterNameLastname(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    decoration: const BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          spreadRadius: -25,
          color: Colors.black54,
          blurRadius: 30,
          offset: Offset(0, 0.25),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(child: _textName(context)),
        Expanded(
          child: _texLastName(context),
        ),
      ],
    ),
  );
}

Widget _textName(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.01,
    ),
    child: TextField(
      controller: con.nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Nombre',
      ),
    ),
  );
}

Widget _texLastName(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.01,
    ),
    child: TextField(
      controller: con.lastNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Apellido',
      ),
    ),
  );
}

Widget _textUser(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.userController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Usuario',
      ),
    ),
  );
}

Widget _textPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.passwordController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Contraseña',
      ),
    ),
  );
}

Widget _textConfirmPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.passwordConfirmController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Confirmar Contraseña',
      ),
    ),
  );
}


 Widget  _textFormRegisterPhone(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.phoneController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        hintText: 'Telefono',
      ),
    ),
  );
}

Widget _textFormRegisterEmail(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    ),
  );
}

Widget _textIdentification(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.identificationController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Numero de Identificación',
      ),
    ),
  );
}

Widget _buttomRegister(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: ElevatedButton(
      onPressed: () => con.register(context),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: colorOnPrimaryVariant,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        'Registrar',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
  );
}

Widget _buttomGetInto(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
