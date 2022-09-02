import 'package:app_asegurate/pages/menu/menu_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import '../../utils.dart';
import 'news_page_controller.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: colorPrimary,
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
                    Hero(
                      tag: index,
                      child: Image.asset(
                        'assets/images/notices_img$index.jpg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20.0,
                            spreadRadius: 5.0)
                      ]),
                      child: GestureDetector(
                        onTap: () {
                          gotoNewsPageDetail(arguments: {
                            'title': dataNews[index].toString(),
                            'id': idNotice[index]['id'],
                            'img': 'assets/images/notices_img$index.jpg',
                            'description': dataNewsDetail[index].toString(),
                          });
                        },
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
                    ),
                  ]);
                },
                slideTransform: const CubeTransform(),
                slideIndicator: CircularSlideIndicator(
                    indicatorBackgroundColor: Colors.white,
                    currentIndicatorColor: colorSecondary,
                    indicatorBorderColor: Colors.grey,
                    padding: const EdgeInsets.only(bottom: 32)),
                itemCount: 5),
          ),
        ]));
  }
}

List dataNews = [
  "Noticia 1  La Nueva Estafa  con Falsas ofertas  de Empleo ",
  "Noticia 2  La Nueva Estafa  con Falsas ofertas  de Empleo ",
  "Noticia 3  La Nueva Estafa con Falsas ofertas  de Empleo ",
  "Noticia 4  La Nueva Estafa con Falsas ofertas  de Empleo ",
  "Noticia 5   La Nueva Estafa  con Falsas ofertas  de Empleo ",
];

List dataNewsDetail = [
  "Noticia 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis diam, pulvinar eu posuere in, blandit id ante. Etiam id tortor malesuada, iaculis dolor eget, eleifend odio. Morbi egestas molestie urna eget accumsan. Sed odio risus, commodo in justo vitae, tempus aliquet massa. Pellentesque dictum placerat nibh vel posuere. Aenean nec massa sit amet ex molestie semper nec id nibh. Duis ullamcorper sem vitae augue maximus molestie quis ac lectus. Pellentesque interdum ex tempor, vulputate nisi rutrum, dignissim erat. Mauris eleifend laoreet est, a blandit tellus tristique vitae. Pellentesque eu ligula tristique, lacinia libero sed, ultrices lectus. Suspendisse potenti. Maecenas quis est pharetra, mattis quam sed, elementum metus. Etiam non ultrices metus, eu aliquam neque. Nulla vitae lacus mauris. Cras at quam sed ex tempor pretium. Praesent fringilla semper eleifend.",
  "Noticia 2  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis diam, pulvinar eu posuere in, blandit id ante. Etiam id tortor malesuada, iaculis dolor eget, eleifend odio. Morbi egestas molestie urna eget accumsan. Sed odio risus, commodo in justo vitae, tempus aliquet massa. Pellentesque dictum placerat nibh vel posuere. Aenean nec massa sit amet ex molestie semper nec id nibh. Duis ullamcorper sem vitae augue maximus molestie quis ac lectus. Pellentesque interdum ex tempor, vulputate nisi rutrum, dignissim erat. Mauris eleifend laoreet est, a blandit tellus tristique vitae. Pellentesque eu ligula tristique, lacinia libero sed, ultrices lectus. Suspendisse potenti. Maecenas quis est pharetra, mattis quam sed, elementum metus. Etiam non ultrices metus, eu aliquam neque. Nulla vitae lacus mauris. Cras at quam sed ex tempor pretium. Praesent fringilla semper eleifend. ",
  "Noticia 3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis diam, pulvinar eu posuere in, blandit id ante. Etiam id tortor malesuada, iaculis dolor eget, eleifend odio. Morbi egestas molestie urna eget accumsan. Sed odio risus, commodo in justo vitae, tempus aliquet massa. Pellentesque dictum placerat nibh vel posuere. Aenean nec massa sit amet ex molestie semper nec id nibh. Duis ullamcorper sem vitae augue maximus molestie quis ac lectus. Pellentesque interdum ex tempor, vulputate nisi rutrum, dignissim erat. Mauris eleifend laoreet est, a blandit tellus tristique vitae. Pellentesque eu ligula tristique, lacinia libero sed, ultrices lectus. Suspendisse potenti. Maecenas quis est pharetra, mattis quam sed, elementum metus. Etiam non ultrices metus, eu aliquam neque. Nulla vitae lacus mauris. Cras at quam sed ex tempor pretium. Praesent fringilla semper eleifend. ",
  "Noticia 4 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis diam, pulvinar eu posuere in, blandit id ante. Etiam id tortor malesuada, iaculis dolor eget, eleifend odio. Morbi egestas molestie urna eget accumsan. Sed odio risus, commodo in justo vitae, tempus aliquet massa. Pellentesque dictum placerat nibh vel posuere. Aenean nec massa sit amet ex molestie semper nec id nibh. Duis ullamcorper sem vitae augue maximus molestie quis ac lectus. Pellentesque interdum ex tempor, vulputate nisi rutrum, dignissim erat. Mauris eleifend laoreet est, a blandit tellus tristique vitae. Pellentesque eu ligula tristique, lacinia libero sed, ultrices lectus. Suspendisse potenti. Maecenas quis est pharetra, mattis quam sed, elementum metus. Etiam non ultrices metus, eu aliquam neque. Nulla vitae lacus mauris. Cras at quam sed ex tempor pretium. Praesent fringilla semper eleifend. ",
  "Noticia 5   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis diam, pulvinar eu posuere in, blandit id ante. Etiam id tortor malesuada, iaculis dolor eget, eleifend odio. Morbi egestas molestie urna eget accumsan. Sed odio risus, commodo in justo vitae, tempus aliquet massa. Pellentesque dictum placerat nibh vel posuere. Aenean nec massa sit amet ex molestie semper nec id nibh. Duis ullamcorper sem vitae augue maximus molestie quis ac lectus. Pellentesque interdum ex tempor, vulputate nisi rutrum, dignissim erat. Mauris eleifend laoreet est, a blandit tellus tristique vitae. Pellentesque eu ligula tristique, lacinia libero sed, ultrices lectus. Suspendisse potenti. Maecenas quis est pharetra, mattis quam sed, elementum metus. Etiam non ultrices metus, eu aliquam neque. Nulla vitae lacus mauris. Cras at quam sed ex tempor pretium. Praesent fringilla semper eleifend. ",
];
