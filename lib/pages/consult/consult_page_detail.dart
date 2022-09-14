import 'package:app_asegurate/pages/consult/detail_page_controller.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils.dart';

class ConsultPageDetail extends StatelessWidget {
  DetailpageController con = Get.put(DetailpageController());
  ConsultPageDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                  _ratingBar()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _reputation(),
                  _score(),
                ],
              )
            ]),
          ),
        ));
  }

  Widget _reputation() {
    return Container(
      margin: EdgeInsets.only(top: 300, left: 20),
      child: Text(
        'Reputación',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _score() {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 350, left: 20),
        child: Text(
          'Calificación',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow,
            ),
            width: 60,
            height: 60,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              '75',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: con.stars.value.toDouble(),
      minRating: 1,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (value2) {
        print(value2);
      },
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
