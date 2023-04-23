// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:frontend/src/domain/domain.dart';
import 'package:frontend/src/local_storage/local_storage.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:shared/shared.dart';

class UserProvider extends InheritedWidget {
  final LocalUser? user;

  const UserProvider({
    super.key,
    required super.child,
    required this.user,
  });

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) =>
      oldWidget.user != user;

  static LocalUser? get(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserProvider>()!.user;

  static bool isLoggedIn(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserProvider>()!.user != null;

  static Future<void> logout(BuildContext context) =>
      context.findAncestorStateOfType<_UserProviderState>()!._removeUser();

  static Future<void> updateUser(
    BuildContext context, {
    required User user,
  }) =>
      context.findAncestorStateOfType<_UserProviderState>()!._updateUser(
            user: user,
          );

  static Future<void> saveUser(
    BuildContext context, {
    required User user,
    required String authToken,
  }) =>
      context.findAncestorStateOfType<_UserProviderState>()!._saveUser(
            user: user,
            authToken: authToken,
          );
}

class UserProviderWidget extends StatefulWidget {
  const UserProviderWidget({
    super.key,
    required this.child,
    required this.storage,
  });
  final Widget child;
  final LocalStorage<LocalUser> storage;
  @override
  State<UserProviderWidget> createState() => _UserProviderState();
}

class _UserProviderState extends State<UserProviderWidget> {
  final ValueNotifier<LocalUser?> _user = ValueNotifier<LocalUser?>(null);

  @override
  void initState() {
    super.initState();
    widget.storage
        .get(LocalUser.objectKey)
        .toTaskEither(() => null)
        .map(
          (FutureOr<LocalUser?>? storageUser) async =>
              await locator<UserRepository>()
                  .isLoggedIn(token: (await storageUser)?.authToken)
                  .match(
            (Object error) async {
              if (error is GrpcError && error.code == kReUseLoginRouteCode)
                return await _removeUser();
            },
            (bool isTokenValid) async {
              if (!isTokenValid) return await _removeUser();

              final LocalUser user = (await storageUser)!;
              locator<AuthTokenInterceptor>().updateToken(user.authToken);
              _user.value = user;
            },
          ).run(),
        )
        .run();
  }

  Future<void> _saveUser({
    required User user,
    required String authToken,
  }) async {
    final LocalUser localUser = LocalUser.fromSharedUser(
      user: user,
      authToken: authToken,
    );
    await widget.storage.save(LocalUser.objectKey, localUser);
    locator<AuthTokenInterceptor>().updateToken(localUser.authToken);
    _user.value = localUser;
  }

  Future<void> _removeUser() async {
    await widget.storage.delete(LocalUser.objectKey);
    locator<AuthTokenInterceptor>().updateToken('');
    _user.value = null;
  }

  Future<void> _updateUser({
    required User user,
  }) async {
    final String? email = user.hasEmail() ? user.email : _user.value?.email;

    final LocalUser? newLocalUser = _user.value?.copyWith(
      firstName: user.hasFirstName() ? user.firstName : null,
      lastName: user.hasLastName() ? user.lastName : null,
      birthDate: user.hasBirthDate() ? user.birthDate.toDateTime() : null,
      email: email!,
    );
    if (newLocalUser == null) return;

    await widget.storage.save(LocalUser.objectKey, newLocalUser);
    _user.value = newLocalUser;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _user,
      builder: (BuildContext context, Widget? child) {
        assert(child != null, 'Child widget should never be null here!');

        debugPrint('UserProvider :: build :: user: ${_user.value}');

        return UserProvider(
          user: _user.value,
          child: child!,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _user.dispose();
    super.dispose();
  }
}
