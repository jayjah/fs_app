// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async' show FutureOr;

import 'package:backend/backend.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

class UserValidationInterceptor {
  const UserValidationInterceptor(this._db);
  final Database _db;

  FutureOr<GrpcError?> isUserValidForMethod(
    ServiceCall call,
    ServiceMethod<dynamic, dynamic> method,
  ) async {
    print('isUserValidForMethod: methodname: ${method.name}');
    print('isUserValidForMethod: metadata: ${call.clientMetadata}');

    switch (method.name) {
      case 'create':
        // Ignore creation of users, because users may create anyone
        if (call.clientMetadata?[':path']?.contains('/UserService/create') ==
            true) return null;
        return await _runValidation(call.clientMetadata);
      case 'update':
        return await _runValidation(call.clientMetadata);
      case 'delete':
        return await _runValidation(call.clientMetadata);
      default:
        return null;
    }
  }

  Future<GrpcError?> _runValidation(Map<String, String>? metaData) async {
    final bool? isAuthenticated = await _isUserAuthenticated(metaData);
    if (isAuthenticated == null) return GrpcError.unauthenticated();
    if (!isAuthenticated)
      return GrpcError.custom(
        kReUseLoginRouteCode,
        'Please login again',
      );

    return null;
  }

// Checks if an user is authenticated or not
//  Returns:
//    - null: if provided `metaData` does not contain any `kAuthTokenHeader`
//    - false: if `_validAuthTokens` does not contain `kAuthTokenHeader` from provided `metaData`
//    - true: if `_validAuthTokens` contains `kAuthTokenHeader` from provided `metaData`
//        AND the difference in creation date and now is smaller than `kTokenValidInDays`
  Future<bool?> _isUserAuthenticated(Map<String, String>? metaData) async {
    if (metaData == null || !metaData.containsKey(kAuthTokenHeader))
      return null;

    final String authTokenFromHeader = metaData[kAuthTokenHeader]!;
    if (authTokenFromHeader.isEmpty) return null;

    return await _db.tokens.isTokenValid(authTokenFromHeader);
  }
}
