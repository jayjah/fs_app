import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

class StatusService extends StatusServiceBase {
  StatusService(this._db);
  final Database _db;
  @override
  Future<Status> ping(ServiceCall call, StatusRequest request) async {
    final PostgreSQLResult dateTimeFromDb = await _db.query('SELECT now();');

    return Status(
      status: 'pong',
      createdAt: Timestamp.fromDateTime(
        dateTimeFromDb.single.toColumnMap()['now'] as DateTime,
      ),
    );
  }
}
