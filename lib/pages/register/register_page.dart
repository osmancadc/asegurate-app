import 'package:app_asegurate/pages/register/register_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_field_validator/password_field_validator.dart';

import '../../utils.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final con = Get.put(RegisterPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: colorSecondary,
          body: SingleChildScrollView(
            child: Stack(children: [
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      _boxFormUser(context),
                      _boxFormIdentification(context),
                      _boxFormDatePicker(context),
                      _boxFormRegisterEmail(context),
                      _boxFormRegisterPhone(context),
                      _boxFormPassword(context),
                      _boxFormValidatePassword(context),
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
        ));
  }

  Widget _boxFormDatePicker(context) {
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
          _textFormDatePicker(context),
        ],
      ),
    );
  }

  Widget _radioButton(context) {
    RegisterPageController con = Get.put(RegisterPageController());
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.00,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text('''
               Cual es tu Perfil
                    Principal 
            ''',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.036,
                  color: colorFont,
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio(
                    value: "seller",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) {
                      con.onChangedRadio(value);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  ),
                  const Text(
                    'Vendedor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Row(
                children: [
                  Radio(
                    value: "buyer",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) {
                      con.onChangedRadio(value);
                    },
                    activeColor: Colors.blue.shade300,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  ),
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

  Widget _textFormDatePicker(context) {
    RegisterPageController con = Get.put(RegisterPageController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        readOnly: true,
        controller: con.dateController.value,
        decoration: InputDecoration(
          labelText: "Fecha de expedición",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          border: InputBorder.none,
          hintText: 'AAAA-MM-DD Fecha de expedición ',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                initialDatePickerMode: DatePickerMode.year,
                routeSettings: RouteSettings(name: 'datePicker'),
              );
              if (picked != null) {
                con.dateController.value.text =
                    picked.toString().substring(0, 10);
              }
            },
            icon: Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxFormRegisterPhone(context) {
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

  Widget _boxFormRegisterEmail(context) {
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

Widget _boxFormValidatePassword(context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.05,
      left: 30,
      right: 30,
    ),
    decoration: const BoxDecoration(),
    child: Column(
      children: [_validationPassword()],
    ),
  );
}

Widget _boxFormUser(context) {
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
      children: [_textName(context)],
    ),
  );
}

Widget _textName(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: con.nameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Nombres',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _texLastName(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.01,
    ),
    child: TextField(
      controller: con.lastNameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Apellidos',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _textUser(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
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
  );
}

Widget _textPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          obscureText: con.obscureText.value,
          controller: con.passwordController,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
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

Widget _validationPassword() {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
      child: PasswordFieldValidator(
    controller: con.passwordController,
    minLength: 6,
    uppercaseCharCount: 1,
    lowercaseCharCount: 1,
    numericCharCount: 1,
    specialCharCount: 1,
    defaultColor: Colors.black,
    successColor: Colors.green,
    failureColor: Colors.red,
  ));
}

Widget _textConfirmPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          obscureText: con.obscureText.value,
          controller: con.passwordConfirmController,
          decoration: const InputDecoration(
            labelText: 'Confirmar Contraseña',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
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

Widget _textFormRegisterPhone(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: con.phoneController,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: 'Número de Celular',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _textFormRegisterEmail(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: con.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Correo Electrónico',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _textIdentification(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: con.identificationController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Numero de Identificación',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget _buttomRegister(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: ElevatedButton(
      onPressed: () => con.register(context),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: colorOnPrimaryVariant,
        padding: const EdgeInsets.symmetric(vertical: 15),
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
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 95, vertical: 4),
    child: ElevatedButton(
      onPressed: () => con.gotoLoginPage(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: colorOnSecondaryVariant,
        padding: const EdgeInsets.symmetric(vertical: 4),
      ),
      child: const Text(
        'Ingresar',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    ),
  );
}
