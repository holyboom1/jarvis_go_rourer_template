import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'auth_data_entity.freezed.dart';
part 'auth_data_entity.g.dart';

@freezed
@HiveType(typeId: 0)
class AuthDataEntity with _$AuthDataEntity {
  factory AuthDataEntity({
    @HiveField(0) @Default('') String token,
    @HiveField(1) @Default('') String refreshToken,
    @HiveField(2) @Default('') String accessToken,
    @HiveField(3) @Default('') String email,
    @HiveField(4) @Default('') String username,
  }) = _AuthDataEntity;

  factory AuthDataEntity.fromJson(Map<String, dynamic> json) => _$AuthDataEntityFromJson(json);
}
