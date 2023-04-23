import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = _Loading;
  const factory NewsState.displaying({
    required final Iterable<News> news,
    final String? message,
  }) = _Displaying;
  const factory NewsState.showCreateForm() = _Create;
  const factory NewsState.showUpdateForm({required News news}) = _Update;
}
