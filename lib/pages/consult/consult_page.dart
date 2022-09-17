import 'package:app_asegurate/pages/consult/consult_controller.dart';
import 'package:app_asegurate/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class ConsultPage extends StatelessWidget {
  const ConsultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ConsultController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: colorFontIcon,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: textTitle,
        titleSpacing: 00.3,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
      ),
      drawer: MenuDrawer().menuDrawer(context),
      backgroundColor: colorSecondary,
      body: SingleChildScrollView(
        child: Column(children: [
          _boxForm(context),
          _radioButton(context),
          _buttomSearch(context),
        ]),
      ),
    );
  }
}

Widget _boxForm(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.10,
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
          _textIdentification(context),
        ],
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
                  onChanged: (value) {
                    con.onChangedRadio(value);
                  },
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
                  value: "nequi_daviplata",
                  groupValue: con.selectedRadio.value,
                  onChanged: (value) {
                    con.onChangedRadio(value);
                  },
                  activeColor: Colors.blue.shade300,
                  fillColor: MaterialStateProperty.all(Colors.white),
                )),
            const Text(
              'Nequi Daviplata',
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

Widget _textIdentification(context) {
  ConsultController con = Get.put(ConsultController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.08,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.textIdentification,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: 'Número de documento o celular',
          prefixIcon: Icon(Icons.person_add_alt_1_rounded)),
    ),
  );
}

Widget _buttomSearch(BuildContext context) {
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
        primary: colorOnPrimaryVariant,
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
