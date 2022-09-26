import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_asegurate/utils.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(Get.arguments['title'].toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Hero(
                tag: Get.arguments['title'].toString(),
                child: Image.asset(Get.arguments['img'],
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: Get.arguments['description'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
