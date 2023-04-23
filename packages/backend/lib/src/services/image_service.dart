// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io' as io;

import 'package:backend/src/db/models/image.dart' as db_model_images;
import 'package:backend/src/services/type_conversion.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

class ImageService extends ImageServiceBase {
  ImageService(this._db);
  final Database _db;

  @override
  Future<Image> createFile(ServiceCall call, Stream<File> request) async {
    final LocalFile? localFile = await fileStreamToLocalFile(request);
    print('localfile: $localFile');
    if (localFile == null) throw GrpcError.unknown();

    await io.File(join('public', '${localFile.name}.${localFile.extension}'))
        .writeAsBytes(localFile.bytes);

    try {
      final int id =
          await _db.images.insertOne(db_model_images.ImageInsertRequest(
        fileName: localFile.name,
        fileExtension: localFile.extension,
        createdAt: DateTime.now(),
      ));

      return (await _db.images.queryImage(id)).toImage();
    } catch (_) {
      await io.File(join('public', '${localFile.name}.${localFile.extension}'))
          .delete();
    }

    throw GrpcError.unknown();
  }

  @override
  Stream<Image> getAll(ServiceCall call, AllRequest request) async* {
    final List<db_model_images.ImageView> images =
        await _db.images.queryImages(request.hasLimit() || request.hasOffset()
            ? QueryParams(
                limit: request.limit,
                offset: request.offset,
              )
            : null);
    for (final db_model_images.ImageView obj in images) yield obj.toImage();
  }

  @override
  Stream<File> getOne(ServiceCall call, IdRequest request) async* {
    final db_model_images.ImageView? imageView = await _getImage(request.id);
    if (imageView == null) {
      yield File();

      return;
    }

    final String fileName = imageView.fileName;
    final String fileExtension = imageView.fileExtension;

    yield* fileStreamFromPath(
      join('public', '$fileName.$fileExtension'),
      fileExtension: fileExtension,
      fileName: fileName,
    );
  }

  @override
  Future<Response> delete(ServiceCall call, IdRequest request) async {
    final db_model_images.ImageView? imageView = await _getImage(request.id);
    if (imageView == null) return Response(isValid: true);

    await io.File(
      join('public', '${imageView.fileName}.${imageView.fileExtension}'),
    ).delete();
    await _db.images.deleteOne(request.id);

    return Response(isValid: true);
  }

  Future<db_model_images.ImageView?> _getImage(int id) =>
      _db.images.queryImage(id);
}
