import 'package:app_asegurate/pages/consult/detail_page_controller.dart';
import 'package:app_asegurate/pages/news/news_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:app_asegurate/pages/pages.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const LogoutPage()),
        GetPage(
            name: '/consult',
            page: () => ConsultPage(),
            arguments: DetailpageController()),
        GetPage(name: '/qualify', page: () => QualifyPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/settings', page: () => const SettingsPage()),
        GetPage(name: '/report', page: () => ReportPage()),
        GetPage(name: '/logout', page: () => const LogoutPage()),
        GetPage(
            name: '/news',
            page: () => const NewsPage(),
            arguments: NewsPageController()),
        GetPage(name: '/newsdetail', page: () => NewsDetailPage()),
        GetPage(name: '/edit', page: () => ProfilePageEdit()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/help', page: () => HelpPage()),
        GetPage(name: '/consultDetail', page: () => ConsultPageDetail()),
        GetPage(name: '/passwordRecovered', page: () => PasswordRecoveredPage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: HexColor('#583BB6'),
      ),
    );
  }
}
