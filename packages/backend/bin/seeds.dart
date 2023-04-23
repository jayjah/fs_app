// ignore_for_file: avoid_dynamic_calls

import 'dart:convert' show base64Encode, jsonDecode, utf8;
import 'dart:io' as io;

import 'package:backend/backend.dart';
import 'package:backend/src/services/user_service.dart';
import 'package:shared/shared.dart' as shared;
import 'package:stormberry/stormberry.dart';

Future<void> main(List<String> _) async {
  final Database db = Database(
    host: io.Platform.environment['DB_HOST'],
    port: int.tryParse(io.Platform.environment['DB_PORT'] ?? ''),
    database: io.Platform.environment['DB_NAME'],
    user: io.Platform.environment['DB_USER'],
    password: io.Platform.environment['DB_PASSWORD'],
    useSSL: false,
  );
  await db.open();
  await _addDefaultData(db, UserService(db).genPasswordHash);

  io.exit(0);
}

typedef GenPass = String Function(String password);

Future<void> _addDefaultData(
  final Database db,
  final GenPass hashF,
) async {
  try {
    final Map<String, dynamic> data = jsonDecode(
      io.File(shared.join('assets', 'default_data.json')).readAsStringSync(),
    ) as Map<String, dynamic>;

    for (final dynamic obj in data["users"] as List<dynamic>) {
      await db.users.insertOne(
        UserInsertRequest(
          firstName: obj["firstName"] as String,
          lastName: obj["lastName"] as String,
          email: obj["email"] as String,
          password: hashF(base64Encode(utf8.encode(obj["password"] as String))),
          birthDate: DateTime.now(),
        ),
      );
    }
    for (final dynamic obj in data["images"] as List<dynamic>) {
      await db.images.insertOne(
        ImageInsertRequest(
          fileName: obj["fileName"] as String,
          fileExtension: obj["fileExtension"] as String,
          createdAt: DateTime.now(),
        ),
      );
    }
    for (final dynamic obj in data["news"] as List<dynamic>) {
      await db.newses.insertOne(
        NewsInsertRequest(
          name: obj["name"] as String,
          shortDescription: obj["shortDescription"] as String,
          text: obj["text"] as String,
          createdAt: DateTime.now(),
        ),
      );
    }
  } catch (e) {
    // ignore: avoid_print
    print('Seeding data :: error: $e');
  }
}
