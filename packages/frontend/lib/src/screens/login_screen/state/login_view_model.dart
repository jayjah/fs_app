part of '../login_screen.dart';

typedef OnLoginSuccess = void Function(User user, String authToken);

abstract class LoginViewModel {
  Future<String?> onLogin(LoginData data);
  Future<String?> onSignupUser(SignupData data);
}

class LoginViewModelImpl implements LoginViewModel {
  const LoginViewModelImpl(
    this._repo,
    this._onLoginSuccess,
  );

  final UserRepository _repo;
  final OnLoginSuccess _onLoginSuccess;

  @override
  Future<String?> onLogin(LoginData data) {
    return _repo.login(email: data.name, password: data.password).match(
      (Object error) => error.toString(),
      (LoginResponse response) {
        if (response.success) {
          _onLoginSuccess(response.user, response.xAuthToken);

          return null;
        }

        if (response.hasMessage()) return response.message;

        return 'Not valid';
      },
    ).run();
  }

  @override
  Future<String?> onSignupUser(SignupData data) {
    if (data.password == null || data.password!.isEmpty)
      // ignore: curly_braces_in_flow_control_structures
      return Future<String>.value('Password not valid!');

    final String? birthDateAsStr = data.additionalSignupData?['birthDate'];
    final DateTime? birthDate =
        birthDateAsStr == null ? null : DateTime.tryParse(birthDateAsStr);

    return _repo
        .createUser(
          User(
            firstName: data.additionalSignupData?['firstName'],
            lastName: data.additionalSignupData?['lastName'],
            birthDate:
                birthDate == null ? null : Timestamp.fromDateTime(birthDate),
            email: data.name,
          ),
          password: data.password!,
        )
        .match(
          (Object error) => error.toString(),
          (User user) => null,
        )
        .run();
  }
}
