// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:frontend/src/user_provider.dart';
import 'package:shared/shared.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repo) : super(const ProfileState.display()) {
    this
      ..on<UpdateProfile>(
        _onUpdateProfile,
        transformer: sequential(),
      )
      ..on<DeleteProfile>(
        _onDeleteProfile,
        transformer: sequential(),
      );
  }

  final UserRepository _repo;

  Future<void> _onDeleteProfile(
    DeleteProfile event,
    Emitter<ProfileState> emit,
  ) async {
    final BuildContext context = event.context;
    if (!context.mounted) return;
    await UserProvider.logout(context);
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    await _repo.updateUser(event.user, event.password).match(
      (Object l) => emit(ProfileState.error(errorMessage: l.toString())),
      (User user) {
        if (event.context.mounted)
          UserProvider.updateUser(event.context, user: user);
        emit(const ProfileState.display());
      },
    ).run();
  }
}
