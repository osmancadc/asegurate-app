import 'package:app_asegurate/helpers/dependency_injection.dart';
import 'package:app_asegurate/pages/search/search_result_controller.dart';
import 'package:app_asegurate/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_asegurate/pages/pages.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  DependencyInjection.initialize();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('en', 'US'),
      Locale('es', 'ES'),
      Locale.fromSubtags(languageCode: 'es'),
    ],
  ));
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
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/search', page: () => ConsultPage(), arguments: DetailpageController()),
        GetPage(name: '/qualify', page: () => QualifyPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/edit', page: () => ProfilePageEdit()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/help', page: () => HelpPage()),
        GetPage(name: '/consultDetail', page: () => ConsultPageResult()),
        GetPage(name: '/passwordRecovery', page: () => PasswordRecoveryPage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: HexColor('#583BB6'),
      ),
    );
  }
}
