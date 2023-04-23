import 'package:backend/src/env/env.dart' as env;
import 'package:backend/src/interceptors/user_authentication.dart';
import 'package:backend/src/services/image_service.dart';
import 'package:backend/src/services/news_service.dart';
import 'package:backend/src/services/status_service.dart';
import 'package:backend/src/services/user_service.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart' show Database;

class Backend {
  const Backend._(
    this._server,
    this._db,
    this._instanceId,
  );
  final Server _server;
  final Database _db;
  final int _instanceId;

  String get serverIsRunningOn =>
      'Server :: $_instanceId :: is listening on port ${_server.port}';

  static Future<Backend> createInstance(final int instanceId) async {
    final Database db = Database(
      host: env.Env.dbHost,
      port: env.Env.dbPort,
      database: env.Env.dbName,
      user: env.Env.dbUser,
      password: env.Env.dbPassword,
      useSSL: false,
    );
    await db.open();

    final Server server = Server(
      <Service>[
        NewsService(db),
        UserService(db),
        ImageService(db),
        StatusService(db),
      ],
      <Interceptor>[
        UserValidationInterceptor(db).isUserValidForMethod,
      ],
    );
    await server.serve(
      port: env.Env.port,
      shared: true,
    );

    return Backend._(
      server,
      db,
      instanceId,
    );
  }

  Future<void> close() async {
    await _db.close();
    await _server.shutdown();
  }
}
