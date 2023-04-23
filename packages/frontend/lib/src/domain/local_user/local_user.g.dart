// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserAdapter extends TypeAdapter<_$_LocalUser> {
  @override
  final int typeId = 1;

  @override
  _$_LocalUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LocalUser(
      id: fields[0] as int,
      email: fields[1] as String,
      authToken: fields[2] as String,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      birthDate: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LocalUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.authToken)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.birthDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalUser _$$_LocalUserFromJson(Map<String, dynamic> json) => _$_LocalUser(
      id: json['id'] as int,
      email: json['email'] as String,
      authToken: json['authToken'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$$_LocalUserToJson(_$_LocalUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'authToken': instance.authToken,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate?.toIso8601String(),
    };
