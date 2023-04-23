import 'dart:async' show FutureOr;
import 'dart:io' as io;

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:frontend/src/repository/image_repository.dart';
import 'package:frontend/src/screens/image_screen/state/image_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart' as shared;

part 'image_event.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc(this._repo) : super(const ImageState.loading()) {
    this
      ..on<GetAllImages>(
        _onGetAll,
        transformer: sequential(),
      )
      ..on<DownloadImage>(
        _onDownloadImage,
        transformer: sequential(),
      )
      ..on<UploadImage>(
        _onUploadImage,
        transformer: sequential(),
      )
      ..on<DeleteImage>(
        _onDeleteImage,
        transformer: sequential(),
      );
  }

  final List<shared.Image> _allImages = <shared.Image>[];
  final ImageRepository _repo;

  FutureOr<void> _onDeleteImage(
    DeleteImage event,
    Emitter<ImageState> emit,
  ) async {
    emit(const ImageState.loading());

    await _repo.delete(event.id).match(
      (Object error) => emit(ImageState.displaying(
        images: _allImages,
        message: 'Error while getting data $error',
      )),
      (bool deleted) {
        if (deleted) {
          _allImages
              .removeWhere((shared.Image element) => element.id == event.id);
        }

        emit(ImageState.displaying(
          images: _allImages,
        ));
      },
    ).run();
  }

  FutureOr<void> _onGetAll(GetAllImages event, Emitter<ImageState> emit) async {
    emit(const ImageState.loading());

    await _repo
        .getAll()
        .match(
          (Object error) => emit(ImageState.displaying(
            images: _allImages,
            message: 'Error while getting data $error',
          )),
          (List<shared.Image> allImages) => emit(ImageState.displaying(
            images: _allImages
              ..clear()
              ..addAll(allImages),
          )),
        )
        .run();
  }

  FutureOr<void> _onDownloadImage(
    DownloadImage event,
    Emitter<ImageState> emit,
  ) async {
    emit(const ImageState.loading());

    await _repo.getOne(event.id).match(
      (Object l) => emit(ImageState.displaying(
        images: _allImages,
        message: 'Error during download $l',
      )),
      (shared.Image r) async {
        late final String message;

        try {
          final String pathToSaveImage = io.Platform.isAndroid
              ? (await getExternalStorageDirectory())!.path
              : (await getDownloadsDirectory())!.path;
          await io.File(shared.join(
            pathToSaveImage,
            '${r.file.metaData.fileName}.${r.file.metaData.extension_2}',
          )).writeAsBytes(r.file.chunkData);
          message = 'Image saved to: $pathToSaveImage';
        } catch (e) {
          message = 'Could not save image locally $e';
        }

        emit(ImageState.displaying(
          images: _allImages,
          message: message,
        ));
      },
    ).run();
  }

  FutureOr<void> _onUploadImage(
    UploadImage event,
    Emitter<ImageState> emit,
  ) async {
    final String fileName, fileExtension, path;
    final List<String> imageNameParts;

    if (_isDesktop) {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();
      final PlatformFile? file = result?.files.first;
      if (file == null || file.path == null) {
        emit(
          ImageState.displaying(
            images: _allImages,
            message: 'Could not pick image',
          ),
        );

        return;
      }
      imageNameParts = file.name.split('.');
      path = file.path!;
    } else {
      final XFile? file =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file == null) {
        emit(
          ImageState.displaying(
            images: _allImages,
            message: 'Could not pick image',
          ),
        );

        return;
      }
      imageNameParts = file.name.split('.');
      path = file.path;
    }
    emit(const ImageState.loading());

    fileName = imageNameParts[0];
    fileExtension = imageNameParts[1];

    await _repo
        .upload(
          shared.Image(
            file: shared.File(
              metaData: shared.MetaData(
                fileName: fileName.toString(),
                extension_2: fileExtension.toString(),
              ),
            ),
          ),
          path: path,
        )
        .match(
          (Object l) => emit(ImageState.displaying(
            images: _allImages,
            message: 'Could not craete image: $l',
          )),
          (shared.Image r) => emit(ImageState.displaying(
            images: _allImages..add(r),
            message: 'Created image: $r',
          )),
        )
        .run();
  }

  bool get _isDesktop =>
      io.Platform.isMacOS || io.Platform.isLinux || io.Platform.isWindows;

  @override
  Future<void> close() {
    _allImages.clear();

    return super.close();
  }
}
