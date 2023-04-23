import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:shared/shared.dart' as shared;

part 'local_user.freezed.dart';
part 'local_user.g.dart';

@freezed
abstract class LocalUser with _$LocalUser {
  @HiveType(typeId: 1, adapterName: 'LocalUserAdapter')
  const factory LocalUser({
    @HiveField(0) required int id,
    @HiveField(1) required String email,
    @HiveField(2) required String authToken,
    @HiveField(3) String? firstName,
    @HiveField(4) String? lastName,
    @HiveField(5) DateTime? birthDate,
  }) = _LocalUser;
  const LocalUser._();
  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);
  factory LocalUser.fromSharedUser({
    required shared.User user,
    required String authToken,
  }) =>
      LocalUser(
        id: user.id,
        email: user.email,
        authToken: authToken,
        birthDate: user.birthDate.toDateTime(),
        lastName: user.lastName,
        firstName: user.firstName,
      );
  static const String objectKey = '_local_user_';
  static const String storageBox = '_users_';
}
