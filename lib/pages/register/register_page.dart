import 'package:app_asegurate/pages/register/register_controller.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final con = Get.put(RegisterPageController());
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: firstColor,
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
                      _boxFormIdentification(context),
                      _boxFormDatePicker(context),
                      _boxFormRegisterPhone(context),
                      _boxFormRegisterEmail(context),
                      _boxFormPassword(context),
                      _boxFormConfirmPassword(context),
                      _radioButton(context),
                      _boxFormTermsAndConditions(context),
                      _buttonRegister(context),
                      _buttonReturn(context),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
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
      ),
      child: Column(
        children: [_textIdentification(context)],
      ),
    );
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
      ),
      child: Column(
        children: [
          _textFormDatePicker(context),
        ],
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
      ),
      child: Column(
        children: [
          _textFormRegisterEmail(context),
        ],
      ),
    );
  }

  Widget _boxFormPassword(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _textPassword(context),
        ],
      ),
    );
  }

  Widget _boxFormConfirmPassword(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _textConfirmPassword(context),
        ],
      ),
    );
  }

  Widget _boxFormTermsAndConditions(context) {
    RegisterPageController con = Get.put(RegisterPageController());
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: 30,
          right: 30,
        ),
        child: CheckboxListTile(
          title: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Acepto'),
                TextSpan(
                  text: ' términos y condiciones',
                  style: TextStyle(color: thirdColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => {
                          TermsAndConditions.show(context),
                        },
                ),
              ],
              style: TextStyle(color: Colors.white),
            ),
          ),
          dense: true,
          activeColor: Colors.black,
          controlAffinity: ListTileControlAffinity.leading,
          value: agree,
          side: BorderSide(color: Colors.white, width: 3.0),
          secondary: Icon(Icons.admin_panel_settings, color: Colors.white),
          onChanged: (value) {
            con.agreeTermsAndConditions = value ?? false;
            setState(() {
              agree = value ?? false;
            });
          },
        ));
  }

  Widget _radioButton(context) {
    RegisterPageController con = Get.put(RegisterPageController());
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
        left: MediaQuery.of(context).size.width * 0.0,
        right: MediaQuery.of(context).size.width * 0.0,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text('Cuál es tu Perfil Principal ',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: fifthColor,
                )),
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
                      con.selectedRadio.value = value as String;
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
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                children: [
                  Radio(
                    value: "buyer",
                    groupValue: con.selectedRadio.value,
                    onChanged: (value) {
                      con.selectedRadio.value = value as String;
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
}

Widget _textIdentification(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: con.identificationController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Número de Identificación *',
        labelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      autovalidateMode: AutovalidateMode.always,
      validator: (value) => validateDocument(value),
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
        labelText: "Fecha de Expedición *",
        labelStyle: TextStyle(
          fontSize: 14,
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
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
              routeSettings: RouteSettings(name: 'datePicker'),
            );
            if (picked != null) {
              con.setDate(picked);
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

Widget _textFormRegisterPhone(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: con.phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Número de Celular *',
        labelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      autovalidateMode: AutovalidateMode.always,
      validator: (value) => validatePhone(value),
    ),
  );
}

Widget _textFormRegisterEmail(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: con.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Correo Electrónico *',
        labelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      validator: (value) => validateEmail(value),
      autovalidateMode: AutovalidateMode.always,
    ),
  );
}

Widget _textPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());

  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: con.hidePassword.value,
          controller: con.passwordController,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            labelStyle: TextStyle(
              fontSize: 14,
            ),
          ),
          validator: (value) => validatePassword(value),
          autovalidateMode: AutovalidateMode.always,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 0,
          left: MediaQuery.of(context).size.width * 0.7,
        ),
        child: TextButton(
          onPressed: () => con.hidePassword.value = !con.hidePassword.value,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Icon(
            con.hidePassword.value ? Icons.visibility_off : Icons.visibility,
            color: firstColor,
          ),
        ),
      ),
    ],
  );
}

Widget _textConfirmPassword(context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: con.hidePassword.value,
          controller: con.passwordConfirmController,
          decoration: InputDecoration(
            labelText: 'Confirmar Contraseña',
            labelStyle: TextStyle(
              fontSize: 14,
            ),
          ),
          validator: (value) => con.validateMatchingPasswords(value),
          autovalidateMode: AutovalidateMode.always,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 0,
          left: MediaQuery.of(context).size.width * 0.7,
        ),
        child: TextButton(
          onPressed: () => con.hidePassword.value = !con.hidePassword.value,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Icon(
            con.hidePassword.value ? Icons.visibility_off : Icons.visibility,
            color: firstColor,
          ),
        ),
      ),
    ],
  );
}

Widget _buttonRegister(BuildContext context) {
  RegisterPageController con = Get.put(RegisterPageController());
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: ElevatedButton(
      onPressed: con.agreeTermsAndConditions ? () => con.register(context) : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: thirdColor,
        padding: const EdgeInsets.symmetric(vertical: 0),
      ),
      child: const Text(
        'Crear Cuenta',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
      ),
    ),
  );
}

Widget _buttonReturn(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 95),
    child: ElevatedButton(
      onPressed: () => Get.offNamedUntil('/login', (route) => false),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: Colors.grey.shade600,
        padding: EdgeInsets.symmetric(vertical: 4),
      ),
      child: const Text(
        'Regresar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    ),
  );
}
