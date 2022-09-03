import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {
  static String BASE_URL = dotenv.env['BASE_URL'].toString();
}
