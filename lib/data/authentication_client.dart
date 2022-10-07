import 'dart:convert';

import 'package:app_asegurate/models/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationClient {
  final FlutterSecureStorage _secureStorage;

  AuthenticationClient(this._secureStorage);

  Future<String> get accessToken async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      return session.token;
    }
    return "";
  }

  Future<Map<String, dynamic>?> getUserInformation() async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      return JwtDecoder.decode(session.token);
    }
    return null;
  }

  Future<void> saveSession(dynamic response) async {
    final Session session = Session(
        token: response["token"],
        expiresIn: response["expiresIn"],
        createdAt: DateTime.now());

    final data = jsonEncode(session.toJson());

    await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> signOut() async {
    await _secureStorage.deleteAll();
  }
}
