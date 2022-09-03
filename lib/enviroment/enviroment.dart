import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';



class Environment {
  static String ENCRIPT_KEY = dotenv.env['ENCRIPT_KEY'] ?? '';
  static  String BASE_URL = dotenv.env['BASE_URL'].toString();
}
