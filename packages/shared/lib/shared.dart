library shared;

// Image export
export 'src/generated/image.pb.dart';
export 'src/generated/image.pbenum.dart';
export 'src/generated/image.pbgrpc.dart';
export 'src/generated/image.pbjson.dart';
// User export
export 'src/generated/user.pb.dart';
export 'src/generated/user.pbenum.dart';
export 'src/generated/user.pbgrpc.dart';
export 'src/generated/user.pbjson.dart';
// News export
export 'src/generated/news.pb.dart';
export 'src/generated/news.pbenum.dart';
export 'src/generated/news.pbgrpc.dart';
export 'src/generated/news.pbjson.dart';
// Timestamp export
export 'src/generated/google/protobuf/timestamp.pb.dart';
export 'src/generated/google/protobuf/timestamp.pbenum.dart';
export 'src/generated/google/protobuf/timestamp.pbjson.dart';
// Status export
export 'src/generated/status.pb.dart';
export 'src/generated/status.pbenum.dart';
export 'src/generated/status.pbgrpc.dart';
export 'src/generated/status.pbjson.dart';
// Request export
export 'src/generated/request.pb.dart';
export 'src/generated/request.pbenum.dart';
export 'src/generated/request.pbjson.dart';
// Response export
export 'src/generated/response.pb.dart';
export 'src/generated/response.pbenum.dart';
export 'src/generated/response.pbjson.dart';
// Library export
export 'package:grpc/grpc.dart' hide Response;
export 'package:protobuf/protobuf.dart';
export 'package:path/path.dart';
export 'package:envied/envied.dart';

import 'package:uuid/uuid.dart';
import 'dart:io' as io;
import 'src/generated/image.pb.dart';

// Constants
//    which are shared in backend and frontend
const String kAuthTokenHeader = 'x-auth-token';
const int kReUseLoginRouteCode = 999;
const Uuid uuidGen = Uuid();
const int kTokenValidInDays = 30;

// Shared methods
//    which are shared in backend and frontend

Stream<File> fileStreamFromPath(
  final String path, {
  required final String fileName,
  required final String fileExtension,
}) async* {
  bool onlyMetaData = true;
  await for (final List<int> fileBuffer in io.File(path).openRead()) {
    if (onlyMetaData) {
      yield File(
        metaData: MetaData(
          fileName: fileName,
          extension_2: fileExtension,
        ),
        chunkData: fileBuffer,
      );
      onlyMetaData = false;
      continue;
    }
    yield File(chunkData: fileBuffer);
  }
}

Future<LocalFile?> fileStreamToLocalFile(final Stream<File> request) async {
  final List<int> fileBytes = [];
  String? fileName, fileExtension;
  await for (final file in request) {
    print('file fileName: ${file.metaData.fileName}');
    print('file fileExtension: ${file.metaData.extension_2}');
    print('file bytes: ${file.chunkData.length}');

    if (file.hasMetaData()) {
      fileName = file.metaData.fileName;
      fileExtension = file.metaData.extension_2;
    }
    fileBytes.addAll(file.chunkData);
  }
  print('result fileName: $fileName');
  print('result fileExtension: $fileExtension');
  print('result bytes: ${fileBytes.length}');
  if (fileName?.isNotEmpty == true &&
      fileExtension?.isNotEmpty == true &&
      fileBytes.isNotEmpty) {
    return LocalFile(
      name: fileName!,
      extension: fileExtension!,
      bytes: fileBytes,
    );
  }

  return null;
}

class LocalFile {
  const LocalFile({
    required this.name,
    required this.extension,
    required this.bytes,
  });
  final String name, extension;
  final List<int> bytes;
}
