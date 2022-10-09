import 'package:app_asegurate/pages/search/search_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_asegurate/utils/utils.dart';

class ConsultPage extends StatelessWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConsultController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: fifthColor,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: textTitle,
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      drawer: MenuDrawer().menuDrawer(context),
      backgroundColor: firstColor,
      body: SingleChildScrollView(
        child: Column(children: [
          _consultTitle(context),
          _boxForm(context),
          _radioButton(context),
          _buttonSearch(context),
        ]),
      ),
    );
  }
}

Widget _consultTitle(context) {
  return Container(
    margin: EdgeInsets.only(top: 50),
    child: Text(
      'CONSULTAR UNA PERSONA',
      style: TextStyle(
        fontFamily: 'TradeGothicInline',
        color: fifthColor,
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _boxForm(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.08,
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.16,
      left: 30,
      right: 30,
    ),
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          _textIdentification(context),
        ],
      ),
    ),
  );
}

Widget _textIdentification(context) {
  ConsultController con = Get.put(ConsultController());

  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[],
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: con.identificationValue,
        decoration: const InputDecoration(
          labelText: 'Número de documento o celular',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget _radioButton(context) {
  ConsultController con = Get.put(ConsultController());
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.04,
      left: MediaQuery.of(context).size.width * 0.2,
      right: MediaQuery.of(context).size.width * 0.1,
    ),
    child: Column(
      children: [
        Row(
          children: [
            Obx(() => Radio(
                  value: "CC",
                  groupValue: con.selectedRadio.value,
                  onChanged: (value) => con.selectedRadio.value = value as String,
                  activeColor: Colors.blue.shade300,
                  fillColor: MaterialStateProperty.all(Colors.white),
                )),
            const Text(
              'Cédula de Ciudadanía',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Obx(() => Radio(
                  value: "PHONE",
                  groupValue: con.selectedRadio.value,
                  onChanged: (value) => con.selectedRadio.value = value as String,
                  activeColor: Colors.blue.shade300,
                  fillColor: MaterialStateProperty.all(Colors.white),
                )),
            const Text(
              'Nequi o Daviplata',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buttonSearch(BuildContext context) {
  ConsultController con = Get.put(ConsultController());
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: ElevatedButton(
      onPressed: () => con.consult(context),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: thirdColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: const Text(
        'Buscar',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    ),
  );
}
