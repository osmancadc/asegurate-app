import 'package:app_asegurate/pages/qualify/qualify_page_controller.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class QualifyPage extends StatelessWidget {
  const QualifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QualifyController());
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
        child: Column(
          children: [
            _boxForm(context),
            _radioButton(context),
            _boxFormRatingData(context),
            _sliderRange(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _commentsRating(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            _buttomSearch(context),
          ],
        ),
      ),
    );
  }
}

Widget _boxForm(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.09,
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
    child: SingleChildScrollView(
      child: Column(
        children: [
          _textIdentification(context),
        ],
      ),
    ),
  );
}

Widget _commentsRating(context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.16,
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
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
          _textComments(context),
        ],
      ),
    ),
  );
}

Widget _boxFormRatingData(BuildContext context) {
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
  QualifyController con = Get.put(QualifyController());
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
      decoration: const InputDecoration(
        hintText: 'Nombre',
      ),
    ),
  );
}

Widget _texLastName(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
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
      decoration: const InputDecoration(
        hintText: 'Apellido',
      ),
    ),
  );
}

Widget _radioButton(context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
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
                  value: "PHONE",
                  groupValue: con.selectedRadio.value,
                  onChanged: (value) {
                    con.onChangedRadio(value);
                  },
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

Widget _sliderRange(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    margin: EdgeInsets.only(
      top: 20,
      left: 20,
      right: 20,
    ),
    child: Column(
      children: [
        Text(
          'Puntuación: 0 - 100',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(() => Text(
              con.valueSliderScore.value.toInt().toString(),
              style: con.valueSliderScore.value.toInt() < 30
                  ? TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
            )),
        Obx(() => Slider(
              value: con.valueSliderScore.value,
              thumbColor: Colors.white,
              activeColor: colorPrimary,
              min: 0,
              max: 100,
              divisions: 10,
              label: con.valueSliderScore.value.round().toString(),
              onChanged: (double value) {
                con.valueSliderScore.value = value;
              },
            )),
      ],
    ),
  );
}

// Widget _textRating(context) {
//   QualifyController con = Get.put(QualifyController());
//   return Container(
//     width: double.infinity,
//     height: MediaQuery.of(context).size.height * 0.08,
//     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     child: TextField(
//       controller: con.scoreController,
//       keyboardType: TextInputType.number,
//       decoration: const InputDecoration(
//         hintText: 'Puntuación (1-100)',
//       ),
//     ),
//   );
// }

Widget _textComments(context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.12,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      maxLines: 3,
      maxLength: 60,
      controller: con.commentsController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Comentarios',
      ),
    ),
  );
}

Widget _textIdentification(context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.08,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      controller: con.documentController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: 'Número de documento o celular',
          prefixIcon: Icon(Icons.person_add_alt_1_rounded)),
    ),
  );
}

Widget _buttomSearch(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: ElevatedButton(
      onPressed: () => con.upload(context),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: colorOnPrimaryVariant,
        padding: const EdgeInsets.symmetric(vertical: 15),
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
