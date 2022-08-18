import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import '../../utils.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  @override
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: colorFontIcon,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: textTitle,
          titleSpacing: 00.3,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
        ),
        body: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.87,
            child: CarouselSlider.builder(
                unlimitedMode: true,
                slideBuilder: (index) {
                  return Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/notices_img$index.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20.0,
                            spreadRadius: 5.0)
                      ]),
                      child: Center(
                        
                        child: Text(
                          dataNews[index].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
                slideTransform: const CubeTransform(),
                slideIndicator: CircularSlideIndicator(
                  indicatorBackgroundColor: Colors.white,
                  currentIndicatorColor: colorSecondary,
                  indicatorBorderColor: Colors.grey,
                ),
                itemCount: 5),
          ),
        ]));
  }
}

List dataNews = [
  "Noticia 1  La Nueva Estafa  con Falsas ofertas  de Empleo ",
  "Noticia 2  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
  "Noticia 3  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
  "Noticia 4  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
  "Noticia 5   La Nueva Estafa \n con Falsas ofertas  de Empleo ",
];
