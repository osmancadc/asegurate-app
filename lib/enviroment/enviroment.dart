// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String ENCRYPTION_KEY = dotenv.env['ENCRYPTION_KEY'].toString();
  static final String BASE_URL = dotenv.env['BASE_URL'].toString();
}
