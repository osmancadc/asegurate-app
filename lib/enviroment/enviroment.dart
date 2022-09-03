import 'dart:convert';
import 'package:app_asegurate/.env'; 

String credentials = '''
ASEGUR4TE
''';
String decoded = "ASEGUR4TE";
Codec<String, String> stringToBase64 = utf8.fuse(base64);

class Environment {
  static  String base_url = BASE_URL;
  String encoded =
      base64.encode(utf8.encode(credentials)); 

      //comentario

}
