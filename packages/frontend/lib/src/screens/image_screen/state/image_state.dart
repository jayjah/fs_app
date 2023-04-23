import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.loading() = _Loading;
  const factory ImageState.displaying({
    required final Iterable<Image> images,
    final String? message,
  }) = _Displaying;
}
