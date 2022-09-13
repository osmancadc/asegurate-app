import 'package:app_asegurate/pages/consult/detail_page_controller.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils.dart';

class ConsultPageDetail extends StatelessWidget {
  DetailpageController con = Get.put(DetailpageController());
  ConsultPageDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        child: Stack(children: [
          _consultBackgroundImage(context),
          _consultShapeImage(context),
          Column(
              children: [
              _consultCircleImage(context),
              _consultName(),
              _consultDocument(),
              _consultCity(),
              _consultStars()
              ]
          )
        ]),
      ),
    );
  }
   Widget _consultStars() {
    return Container(
      child: Text(
        con.stars.value,
        style: TextStyle(
          color: colorFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
    Widget _consultName() {
    return Container(
      child: Text(
        con.name.value,
        style: TextStyle(
          color: colorFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
      Widget _consultDocument() {
    return Container(
      child: Text(
        con.document.value,
        style: TextStyle(
          color: colorFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
        Widget _consultCity() {
    return Container(
      child: Text(
      'Bogotá - Colombia',
        style: TextStyle(
          color: colorFont,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

    Widget _consultCircleImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 70, right: 70, bottom: 0),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.35,
      child: CircleAvatar(
        backgroundImage: NetworkImage(con.photo.value),
      ),
    );
  }

  Widget _consultShapeImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 20.0,
            spreadRadius: 5.0)
      ]),
    );
  }

  Widget _consultBackgroundImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.network(
        con.photo.value,
        fit: BoxFit.cover,
      ),
    );
  }
}
