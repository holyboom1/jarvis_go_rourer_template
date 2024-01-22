import 'package:hive_flutter/hive_flutter.dart';

import '../../entities/entities.dart';

abstract interface class HiveProvider {
  late Box<AuthDataEntity> authDataBox;

  Future<void> init();
}
