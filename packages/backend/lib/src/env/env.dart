// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_declarations

import 'package:shared/shared.dart';

part 'env.g.dart';

@Envied(
  obfuscate: false,
  requireEnvFile: true,
  path: '../../.env',
)
abstract class Env {
  @EnviedField(varName: 'PORT')
  static final int port = _Env.port;
  @EnviedField(varName: 'DB_HOST')
  static final String dbHost = _Env.dbHost;
  @EnviedField(varName: 'DB_PORT')
  static final int dbPort = _Env.dbPort;
  @EnviedField(varName: 'DB_USER')
  static final String dbUser = _Env.dbUser;
  @EnviedField(varName: 'DB_PASSWORD')
  static final String dbPassword = _Env.dbPassword;
  @EnviedField(varName: 'DB_NAME')
  static final String dbName = _Env.dbName;
  @EnviedField(varName: 'PASSWORD_SALT')
  static final String passwordSalt = _Env.passwordSalt;
}
