import 'package:app_asegurate/pages/consult/detail_page_controller.dart';
import 'package:app_asegurate/pages/news/news_page_controller.dart';
import 'package:app_asegurate/pages/settings/settings_page_controller.dart';
import 'package:app_asegurate/utils.dart';
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
        GetPage(
            name: '/consult',
            page: () => ConsultPage(),
            arguments: DetailpageController()),
        GetPage(name: '/consultDetail', page: () => ConsultPageDetail()),
      ],
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: HexColor('#583BB6'),
          colorScheme: ColorScheme(
              primary: HexColor('#005074'),
              secondary: HexColor('#664FB2'),
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey,
              onSurface: Colors.grey,
              primaryVariant: HexColor('#3FD7B2'),
              secondaryVariant: HexColor('#00FFB4'))),
    );
  }
}
