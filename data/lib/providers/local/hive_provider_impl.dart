import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../entities/entities.dart';
import 'hive_provider.dart';

class HiveProviderImpl implements HiveProvider {
  @override
  late Box<AuthDataEntity> authDataBox;

  static const String _keyAuthData = 'auth_data';

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> init() async {
    String? encryptionKey = await secureStorage.read(key: 'key');
    if (encryptionKey == null) {
      final List<int> key = Hive.generateSecureKey();
      encryptionKey = base64UrlEncode(key);
      await secureStorage.write(
        key: 'encryptionKey',
        value: encryptionKey,
      );
    }
    final Uint8List encryptionKeyUInt8List = base64Url.decode(encryptionKey);
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(AuthDataEntityAdapter());

      authDataBox = await Hive.openBox<AuthDataEntity>(
        _keyAuthData,
        encryptionCipher: HiveAesCipher(encryptionKeyUInt8List),
      );
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('#HIVE error# : $e');
        print(stacktrace);
      }
    }
  }
}
