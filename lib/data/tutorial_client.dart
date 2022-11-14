import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TutorialClient {
  final FlutterSecureStorage _secureStorage;
  TutorialClient(this._secureStorage);

  Future<bool> get viewedProfile async {
    try {
      final data = await _secureStorage.read(key: 'VIEWED_PROFILE');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get viewedEditProfile async {
    try {
      final data = await _secureStorage.read(key: 'VIEWED_EDIT_PROFILE');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get viewedSearch async {
    try {
      final data = await _secureStorage.read(key: 'VIEWED_SEARCH');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get viewedSearchResult async {
    try {
      final data = await _secureStorage.read(key: 'VIEWED_SEARCH_RESULT');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get viewedQualify async {
    try {
      final data = await _secureStorage.read(key: 'VIEWED_QUALIFY');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveState(String key) async {
    await _secureStorage.write(key: key, value: 'true');
  }
}
