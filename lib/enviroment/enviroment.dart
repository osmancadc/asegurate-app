import 'dart:convert';

String credentials = '''
ASEGUR4TE
''';
String decoded = "ASEGUR4TE";
Codec<String, String> stringToBase64 = utf8.fuse(base64);

class Environment {
  static const String base_url = "https://asegurate.free.beeceptor.com";
  String encoded =
      base64.encode(utf8.encode(credentials)); 

}
