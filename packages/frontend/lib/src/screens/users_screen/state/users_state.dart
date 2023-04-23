import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = _Loading;
  const factory UsersState.displaying({
    required final Iterable<User> users,
    final String? message,
  }) = _Displaying;
}
