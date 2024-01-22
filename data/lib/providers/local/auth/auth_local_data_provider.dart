import 'package:hive_flutter/hive_flutter.dart';

import '../../../data.dart';

class AuthHiveProvider {
  final Box<AuthDataEntity> _authDataBox;

  final String _keyAuthData = 'auth_data';

  AuthHiveProvider(this._authDataBox);

  AuthDataEntity? getAuthData() {
    return _authDataBox.get(_keyAuthData);
  }

  Future<void> addAuthData(AuthDataEntity authData) async {
    await _authDataBox.put(_keyAuthData, authData);
  }

  Future<void> updateAuthData(AuthDataEntity authData) async {
    await _authDataBox.put(_keyAuthData, authData);
  }

  Future<void> deleteAuthData() async {
    await _authDataBox.clear();
  }

  Future<bool> isSignedIn() async {
    return _authDataBox.containsKey(_keyAuthData);
  }
}
