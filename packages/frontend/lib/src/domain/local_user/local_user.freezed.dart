// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) {
  return _LocalUser.fromJson(json);
}

/// @nodoc
mixin _$LocalUser {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get authToken => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalUserCopyWith<LocalUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalUserCopyWith<$Res> {
  factory $LocalUserCopyWith(LocalUser value, $Res Function(LocalUser) then) =
      _$LocalUserCopyWithImpl<$Res, LocalUser>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String email,
      @HiveField(2) String authToken,
      @HiveField(3) String? firstName,
      @HiveField(4) String? lastName,
      @HiveField(5) DateTime? birthDate});
}

/// @nodoc
class _$LocalUserCopyWithImpl<$Res, $Val extends LocalUser>
    implements $LocalUserCopyWith<$Res> {
  _$LocalUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? authToken = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalUserCopyWith<$Res> implements $LocalUserCopyWith<$Res> {
  factory _$$_LocalUserCopyWith(
          _$_LocalUser value, $Res Function(_$_LocalUser) then) =
      __$$_LocalUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String email,
      @HiveField(2) String authToken,
      @HiveField(3) String? firstName,
      @HiveField(4) String? lastName,
      @HiveField(5) DateTime? birthDate});
}

/// @nodoc
class __$$_LocalUserCopyWithImpl<$Res>
    extends _$LocalUserCopyWithImpl<$Res, _$_LocalUser>
    implements _$$_LocalUserCopyWith<$Res> {
  __$$_LocalUserCopyWithImpl(
      _$_LocalUser _value, $Res Function(_$_LocalUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? authToken = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_$_LocalUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'LocalUserAdapter')
class _$_LocalUser extends _LocalUser {
  const _$_LocalUser(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.authToken,
      @HiveField(3) this.firstName,
      @HiveField(4) this.lastName,
      @HiveField(5) this.birthDate})
      : super._();

  factory _$_LocalUser.fromJson(Map<String, dynamic> json) =>
      _$$_LocalUserFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String authToken;
  @override
  @HiveField(3)
  final String? firstName;
  @override
  @HiveField(4)
  final String? lastName;
  @override
  @HiveField(5)
  final DateTime? birthDate;

  @override
  String toString() {
    return 'LocalUser(id: $id, email: $email, authToken: $authToken, firstName: $firstName, lastName: $lastName, birthDate: $birthDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, authToken, firstName, lastName, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalUserCopyWith<_$_LocalUser> get copyWith =>
      __$$_LocalUserCopyWithImpl<_$_LocalUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalUserToJson(
      this,
    );
  }
}

abstract class _LocalUser extends LocalUser {
  const factory _LocalUser(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String authToken,
      @HiveField(3) final String? firstName,
      @HiveField(4) final String? lastName,
      @HiveField(5) final DateTime? birthDate}) = _$_LocalUser;
  const _LocalUser._() : super._();

  factory _LocalUser.fromJson(Map<String, dynamic> json) =
      _$_LocalUser.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get authToken;
  @override
  @HiveField(3)
  String? get firstName;
  @override
  @HiveField(4)
  String? get lastName;
  @override
  @HiveField(5)
  DateTime? get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$_LocalUserCopyWith<_$_LocalUser> get copyWith =>
      throw _privateConstructorUsedError;
}
