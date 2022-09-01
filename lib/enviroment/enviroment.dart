import 'dart:convert';

String credentials = '''
ASEGUR4TE
''';
String decoded = "ASEGUR4TE";
Codec<String, String> stringToBase64 = utf8.fuse(base64);

class Environment {
  static const String base_url = "https://pftfkfuts5.execute-api.us-east-1.amazonaws.com/prod";
  String encoded =
      base64.encode(utf8.encode(credentials)); 

      //comentario

}
