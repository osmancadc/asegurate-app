import 'package:app_asegurate/pages/news/news_page.dart';
import 'package:get/get.dart';

class NewsPageController extends GetxController {
  List dataNews = [
    "Noticia 1  La Nueva Estafa  con Falsas ofertas  de Empleo ",
    "Noticia 2  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
    "Noticia 3  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
    "Noticia 4  La Nueva Estafa \n con Falsas ofertas  de Empleo ",
    "Noticia 5   La Nueva Estafa \n con Falsas ofertas  de Empleo ",
  ];
}

void gotoNewsPageDetail({arguments}) {
  Get.toNamed('/newsdetail', arguments: arguments);

  print(arguments);
}

var idNotice = [
  {
    "id": "1",
  },
  {
    "id": "2",
  },
  {
    "id": "3",
  },
  {
    "id": "4",
  },
  {
    "id": "5",
  },
];
