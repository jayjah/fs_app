part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.error({required final String errorMessage}) =
      _Error;
  const factory ProfileState.display() = _Display;
}
