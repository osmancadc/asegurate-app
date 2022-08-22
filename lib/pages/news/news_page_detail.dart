import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['title'].toString()),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Hero(
                
                tag: Get.arguments['title'].toString(),
                child: Image.asset(Get.arguments['img'],
                    fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: Get.arguments['description'].toString(),
                  style: TextStyle(
                    color: Colors.black,
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
