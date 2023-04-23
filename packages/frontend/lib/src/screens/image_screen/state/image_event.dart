part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {
  const ImageEvent();
}

@immutable
class GetAllImages extends ImageEvent {
  const GetAllImages();
}

@immutable
class DownloadImage extends ImageEvent {
  const DownloadImage({required this.id});
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadImage &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@immutable
class UploadImage extends ImageEvent {
  const UploadImage();
}

@immutable
class DeleteImage extends ImageEvent {
  const DeleteImage({required this.id});
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteImage &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
