// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:backend/src/services/validation/validator.dart';
import 'package:shared/shared.dart'
    show CreateUser, GrpcError, LoginUserRequest, UpdateUser;

class UserCreateValidation extends Validator<CreateUser> {
  UserCreateValidation() {
    addRule(
      (CreateUser obj) => obj.hasEmail()
          ? null
          : GrpcError.invalidArgument('Email is not given'),
    );
    addRule(
      (CreateUser obj) => obj.hasPassword()
          ? null
          : GrpcError.invalidArgument('Password is not given'),
    );
  }
}

class UserUpdateValidation extends Validator<UpdateUser> {
  UserUpdateValidation() {
    addRule(
      (UpdateUser obj) =>
          obj.hasId() ? null : GrpcError.invalidArgument('Id is not given'),
    );
  }
}

class UserLoginValidation extends Validator<LoginUserRequest> {
  UserLoginValidation() {
    addRule(
      (LoginUserRequest obj) => obj.hasPassword()
          ? null
          : GrpcError.invalidArgument('Password is not given'),
    );
    addRule(
      (LoginUserRequest obj) {
        if (!obj.hasEmail())
          return GrpcError.invalidArgument('Email is not given');

        final String email = obj.email;

        // Minimal email input validation
        // See here for more details: https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html
        if (!email.contains('@') || email.length > 254)
          return GrpcError.invalidArgument('Email has wrong format');

        return null;
      },
    );
  }
}
