// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert' show base64Decode, utf8;

import 'package:backend/src/db/models/token.dart' as db_model_token;
import 'package:backend/src/db/models/user.dart' as db_model_user;
import 'package:backend/src/env/env.dart';
import 'package:backend/src/services/type_conversion.dart';
import 'package:backend/src/services/validation/user_validation.dart';
import 'package:conduit_password_hash/pbkdf2.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

class UserService extends UserServiceBase {
  UserService(this._db);
  final Database _db;
  final UserCreateValidation _userCreateValidation = UserCreateValidation();
  final UserUpdateValidation _userUpdateValidation = UserUpdateValidation();
  final UserLoginValidation _userLoginValidation = UserLoginValidation();
  final PBKDF2 _passwordHasher = PBKDF2();

  @override
  Future<User> create(ServiceCall call, CreateUser request) async {
    final GrpcError? validationError = _userCreateValidation.validate(request);
    if (validationError != null) throw validationError;

    // Checks if a user currently already exist with given email
    if (await _db.users.query(const LoginQuery(), request.email) != null)
      throw GrpcError.alreadyExists('User with given email already exists!');

    final int id = await _db.users.insertOne(db_model_user.UserInsertRequest(
      firstName: request.firstName,
      lastName: request.lastName,
      email: request.email,
      password: genPasswordHash(request.password),
      birthDate: request.birthDate.toDateTime(),
    ));

    return (await _db.users.queryUser(id)).toUser();
  }

  @override
  Stream<User> getAll(ServiceCall call, AllRequest request) async* {
    final QueryParams? requestParams = request.hasLimit() || request.hasOffset()
        ? QueryParams(
            limit: request.limit,
            offset: request.offset,
          )
        : null;

    for (final db_model_user.UserView obj
        in await _db.users.queryUsers(requestParams)) yield obj.toUser();
  }

  @override
  Future<User> getOne(ServiceCall call, IdRequest request) async {
    return (await _db.users.queryUser(request.id)).toUser();
  }

  @override
  Future<User> update(ServiceCall call, UpdateUser request) async {
    final GrpcError? validationError = _userUpdateValidation.validate(request);
    if (validationError != null) throw validationError;

    final int id = request.id;

    await _db.users.updateOne(db_model_user.UserUpdateRequest(
      id: id,
      firstName: request.hasFirstName() ? request.firstName : null,
      lastName: request.hasLastName() ? request.lastName : null,
      email: request.hasEmail() ? request.email : null,
      password:
          request.hasPassword() ? genPasswordHash(request.password) : null,
      birthDate: request.hasBirthDate() ? request.birthDate.toDateTime() : null,
    ));

    return (await _db.users.queryUser(id)).toUser();
  }

  @override
  Future<LoginResponse> login(
    ServiceCall call,
    LoginUserRequest request,
  ) async {
    final GrpcError? validationError = _userLoginValidation.validate(request);
    if (validationError != null) throw validationError;

    final db_model_user.UserView? userView =
        await _db.users.query(const LoginQuery(), request.email);
    if (userView == null)
      return LoginResponse(
        success: false,
        message: 'No user found by: ${request.email}',
      );

    final String? passwordHash =
        request.hasPassword() ? genPasswordHash(request.password) : null;

    if (userView.password != passwordHash)
      return LoginResponse(
        success: false,
        message: 'Password not valid',
      );

    final String xAuthToken = uuidGen.v4();
    await _db.tokens.insertOne(db_model_token.TokenInsertRequest(
      token: xAuthToken,
      createdAt: DateTime.now(),
    ));

    return LoginResponse(
      success: true,
      xAuthToken: xAuthToken,
      user: userView.toUser(),
    );
  }

  @override
  Future<Response> delete(ServiceCall call, IdRequest request) async {
    await _db.users.deleteOne(request.id);

    return Response(isValid: true);
  }

  String genPasswordHash(final String pw) {
    //  Frontend sends:          password: base64Encode(
    //             utf8.encode(password),
    //           )
    return _passwordHasher.generateBase64Key(
      utf8.decode(base64Decode(pw)),
      Env.passwordSalt,
      1000,
      32,
    );
  }

  @override
  Future<LoggedInResponse> isLoggedIn(
    ServiceCall call,
    LoggedInUserRequest request,
  ) async {
    final bool isTokenValid = await _db.tokens.isTokenValid(request.token);
    // delete token if token is not valid
    if (!isTokenValid) await _db.tokens.deleteOne(request.token);

    return LoggedInResponse(success: isTokenValid);
  }
}

class LoginQuery extends Query<db_model_user.UserView?, String> {
  const LoginQuery();
  @override
  Future<db_model_user.UserView?> apply(Database db, String params) async {
    final PostgreSQLResult rows = await db.query(
      'SELECT * FROM "users"\n'
      'WHERE "users"."email" = @userEmail',
      <String, dynamic>{'userEmail': params},
    );
    if (rows.isEmpty) return null;

    try {
      return rows
          .map<db_model_user.UserView>((PostgreSQLResultRow r) =>
              db_model_user.UserViewQueryable()
                  .decode(TypedMap(r.toColumnMap())))
          .toList()
          .first;
    } catch (_) {
      return null;
    }
  }
}
