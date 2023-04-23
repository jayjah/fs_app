import 'dart:async' show FutureOr;
import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:frontend/src/repository/repository.dart';
import 'package:shared/shared.dart';

abstract class ImageRepository implements Repository<Image> {
  const ImageRepository();
  @override
  @Deprecated('Use `upload` instead')
  TaskEither<Object, Image> create(Image data) {
    throw UnimplementedError('Use `upload` instead');
  }

  @override
  @Deprecated('`update` for class `ImageRepositoryI` will not be implemented')
  TaskEither<Object, Image> update(Image data) {
    throw UnimplementedError(
      'ImageRepository :: update :: will not be implemented!',
    );
  }

  TaskEither<Object, Image> upload(Image data, {String? path});
}

class ImageRepositoryImpl extends ImageRepository {
  const ImageRepositoryImpl(this._imageApi);
  final ImageServiceClient _imageApi;

  @override
  TaskEither<Object, Image> upload(Image data, {String? path}) {
    return TaskEither<Object, Image>.tryCatch(
      () => _imageApi.createFile(
        path != null
            ? fileStreamFromPath(
                path,
                fileName: data.file.metaData.fileName,
                fileExtension: data.file.metaData.extension_2,
              )
            : Stream<File>.value(
                File(
                  metaData: data.file.metaData,
                  chunkData: data.file.chunkData,
                ),
              ),
      ),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, List<Image>> getAll() {
    return TaskEither<Object, List<Image>>.tryCatch(
      () => _imageApi.getAll(AllRequest()).toList(),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, Image> getOne(int id) {
    return TaskEither<Object, LocalFile?>.tryCatch(
      () => fileStreamToLocalFile(_imageApi.getOne(IdRequest(id: id))),
      (Object error, StackTrace stackTrace) => error,
    ).map<Image>(
      (LocalFile? localFile) => localFile == null || localFile.bytes.isEmpty
          ? Image.getDefault()
          : Image(
              file: File(
                metaData: MetaData(
                  fileName: localFile.name,
                  extension_2: localFile.extension,
                ),
                chunkData: localFile.bytes,
              ),
            ),
    );
  }

  @override
  TaskEither<Object, bool> delete(int id) {
    return TaskEither<Object, Response>.tryCatch(
      () async => await _imageApi.delete(IdRequest(id: id)),
      (Object error, StackTrace stackTrace) => error,
    ).map((Response r) => r.isValid);
  }

  @override
  FutureOr<void> dispose() {}
}
