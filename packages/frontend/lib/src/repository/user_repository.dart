import 'dart:async' show FutureOr;
import 'dart:convert' show base64Encode, utf8;

import 'package:fpdart/fpdart.dart' show TaskEither;
import 'package:frontend/src/repository/repository.dart';
import 'package:shared/shared.dart';

abstract class UserRepository implements Repository<User> {
  const UserRepository();
  @override
  @Deprecated('Use `updateUser` instead')
  TaskEither<Object, User> update(User data) {
    throw UnimplementedError('Use `updateUser` instead');
  }

  @override
  @Deprecated('Use `createUser` instead')
  TaskEither<Object, User> create(User data) {
    throw UnimplementedError('Use `createUser` instead');
  }

  TaskEither<Object, User> updateUser(
    User data,
    String? password,
  );
  TaskEither<Object, User> createUser(
    User data, {
    required final String password,
  });
  TaskEither<Object, LoginResponse> login({
    required final String email,
    required final String password,
  });
  TaskEither<Object, bool> isLoggedIn({
    required String? token,
  });
}

class UserRepositoryImpl extends UserRepository {
  const UserRepositoryImpl(this._userApi);
  final UserServiceClient _userApi;

  @override
  TaskEither<Object, User> createUser(
    User data, {
    required final String password,
  }) {
    return TaskEither<Object, User>.tryCatch(
      () => _userApi.create(
        CreateUser(
          firstName: data.firstName,
          lastName: data.lastName,
          birthDate: data.birthDate, //Timestamp.fromDateTime(DateTime.now()),
          password: _createBase64String(password),
          email: data.email,
        ),
      ),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, List<User>> getAll() {
    return TaskEither<Object, List<User>>.tryCatch(
      () => _userApi.getAll(AllRequest()).toList(),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, User> getOne(int id) {
    return TaskEither<Object, User>.tryCatch(
      () => _userApi.getOne(IdRequest(id: id)),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, User> updateUser(User data, final String? password) {
    return TaskEither<Object, User>.tryCatch(
      () => _userApi.update(UpdateUser(
        id: data.id,
        email: data.email,
        firstName: data.firstName,
        lastName: data.lastName,
        birthDate: data.birthDate,
        password: password != null ? _createBase64String(password) : null,
      )),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, bool> delete(int id) {
    return TaskEither<Object, Response>.tryCatch(
      () async => await _userApi.delete(IdRequest(id: id)),
      (Object error, StackTrace stackTrace) => error,
    ).map((Response r) => r.isValid);
  }

  @override
  TaskEither<Object, LoginResponse> login({
    required String email,
    required String password,
  }) {
    return TaskEither<Object, LoginResponse>.tryCatch(
      () async => await _userApi.login(LoginUserRequest(
        email: email,
        password: _createBase64String(password),
      )),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, bool> isLoggedIn({
    required String? token,
  }) {
    if (token == null) return TaskEither<Object, bool>.right(false);

    return TaskEither<Object, LoggedInResponse>.tryCatch(
      () async => await _userApi.isLoggedIn(LoggedInUserRequest(token: token)),
      (Object error, StackTrace stackTrace) => error,
    ).map((LoggedInResponse r) => r.success);
  }

  @override
  FutureOr<void> dispose() {}

  String _createBase64String(final String pw) => base64Encode(
        utf8.encode(pw),
      );
}
