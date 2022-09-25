import 'package:app_asegurate/pages/qualify/qualify_page_controller.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
            _boxIdentification(context),
            _radioButton(context),
            _boxFullName(context),
            _scoreSelector(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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

Widget _boxIdentification(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.07,
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.05,
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
                  groupValue: con.typeRadio.value,
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
                  groupValue: con.typeRadio.value,
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

Widget _boxFullName(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    child: Row(
      children: [
        Expanded(child: _textName(context)),
      ],
    ),
  );
}

Widget _scoreSelector(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
  return RatingBar.builder(
    glow: false,
    unratedColor: Colors.black54,
    itemSize: 45,
    initialRating: 3,
    minRating: 0.5,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.yellow.shade500,
      size: 100,
      shadows: const [Shadow(color: Colors.white, blurRadius: 20)],
    ),
    onRatingUpdate: (double value) {
      con.onChangedScore(value);
    },
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

Widget _textComments(context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    height: MediaQuery.of(context).size.height * 0.13,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: TextField(
      maxLines: 5,
      maxLength: 255,
      controller: con.commentsController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Comentarios',
      ),
    ),
  );
}

Widget _buttomSearch(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
    child: ElevatedButton(
      onPressed: () => con.upload(context),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: colorOnPrimaryVariant,
        padding: const EdgeInsets.symmetric(vertical: 10),
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

Widget _textIdentification(context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: con.valueController,
        decoration: const InputDecoration(
          labelText: 'Número de documento o celular',
          labelStyle: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}

Widget _textName(BuildContext context) {
  QualifyController con = Get.put(QualifyController());
  return Container(
    color: Colors.grey.shade400,
    padding: EdgeInsets.symmetric(horizontal: 20),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.02,
      right: MediaQuery.of(context).size.width * 0.01,
    ),
    child: TextField(
      readOnly: true,
      controller: con.nameController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: 'Nombre completo',
      ),
    ),
  );
}
