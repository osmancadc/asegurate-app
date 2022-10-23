import 'dart:convert';

import 'package:app_asegurate/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountClient {
  final FlutterSecureStorage _secureStorage;
  AccountClient(this._secureStorage);

  Future<User?> get userData async {
    try {
      final data = await _secureStorage.read(key: 'USER');
      if (data != null) {
        final user = User.fromJson(jsonDecode(data));
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    final data = jsonEncode(user.toJson());

    await _secureStorage.write(key: 'USER', value: data);
  }

  Future<void> removeUser() async {
    await _secureStorage.delete(key: 'USER');
  }
}
