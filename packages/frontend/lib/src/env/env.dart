// ignore_for_file: avoid_classes_with_only_static_members

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
  @EnviedField(varName: 'SERVER_HOST')
  static final String serverHost = _Env.serverHost;
  @EnviedField(varName: 'PASSWORD_SALT')
  static final String passwordSalt = _Env.passwordSalt;
}
