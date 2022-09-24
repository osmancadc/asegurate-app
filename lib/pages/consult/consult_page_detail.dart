import 'package:app_asegurate/pages/consult/detail_page_controller.dart';
import 'package:app_asegurate/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blur/blur.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils.dart';

class ConsultPageDetail extends StatelessWidget {
  ConsultPageDetail({Key? key}) : super(key: key);

  final DetailpageController con = Get.put(DetailpageController());

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
              Column(
                children: [
                  _consultCircleImage(context),
                  _consultName(),
                  SizedBox(height: 5),
                  _consultDocument(),
                  SizedBox(height: 5),
                  _ratingBar(),
                  _imageCertified(context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _reputation(context),
                  _score(context),
                ],
              )
            ]),
          ),
        ));
  }

  Widget _imageCertified(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.06),
      child: con.certified.value
          ? Image.asset('assets/images/certified.png', width: 500, height: 320)
          : null,
    );
  }

  Widget _reputation(BuildContext context) {
    final reputation = con.reputation.value;
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 1.05),
        child: const Text(
          'Reputación',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: con.getColorScale(reputation),
          ),
          width: 70,
          height: 70,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            reputation.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    ]);
  }

  Widget _score(BuildContext context) {
    final score = con.score.value;
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 1.05),
        child: const Text(
          'Calificación',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * 0.02,
      ),
      Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: con.getColorScale(score),
          ),
          width: 70,
          height: 70,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            score.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
          ),
        ),
      ]),
    ]);
  }

  Widget _ratingBar() {
    return RatingBar.builder(
      initialRating: con.stars.value == 0 ? 0 : con.stars.value.toDouble(),
      itemSize: 40.0,
      minRating: 0,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: false,
      unratedColor: Colors.white70,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onRatingUpdate: (value2) {},
    );
  }

  Widget _consultName() {
    return con.name.value == ''
        ? Container()
        : Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).size.height * 0.02),
            child: Text(
              con.name.value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          );
  }

  Widget _consultDocument() {
    return con.document.value == ''
        ? Container()
        : Text(
            formatDocument(con.document.value),
            style: TextStyle(
              color: colorFont,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          );
  }

  Widget _consultCircleImage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 70, right: 70, top: 15),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.26,
      child: CircleAvatar(
        backgroundImage: con.photo.value == ''
            ? const AssetImage('assets/images/no_image.png') as ImageProvider
            : NetworkImage(con.photo.value),
      ),
    );
  }

  Widget _consultBackgroundImage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.47,
      child: con.photo.value == ''
          ? Image.asset('assets/images/no_image.png', fit: BoxFit.cover)
              .blurred(blur: 5, blurColor: Colors.white, colorOpacity: 1)
          : Image.network(con.photo.value, fit: BoxFit.cover)
              .blurred(colorOpacity: 0.5, blur: 8, blurColor: Colors.black12),
    );
  }
}
