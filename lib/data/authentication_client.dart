import 'dart:convert';

import 'package:app_asegurate/models/authentication_response.dart';
import 'package:app_asegurate/models/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationClient {
  final FlutterSecureStorage _secureStorage;

  AuthenticationClient(this._secureStorage);

  Future<String> get accessToken async {
    try {
      final data = await _secureStorage.read(key: 'SESSION');
      if (data != null) {
        final session = Session.fromJson(jsonDecode(data));
        return session.token;
      }
      return "";
    } catch (e) {
      return "";
    }
  }

  Future<String> getUserId() async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      return JwtDecoder.decode(session.token)['id'];
    }
    return '';
  }

  Future<void> saveSession(AuthenticationResponse response) async {
    final Session session = Session(
      token: response.token,
      expiresIn: response.expiresIn,
      createdAt: DateTime.now(),
    );

    final data = jsonEncode(session.toJson());

    await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> signOut() async {
    await _secureStorage.deleteAll();
  }
}
