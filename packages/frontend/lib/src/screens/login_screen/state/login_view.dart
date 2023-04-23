part of '../login_screen.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.loginViewModel,
  });
  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'JayJah',
      logo: null,
      onLogin: loginViewModel.onLogin,
      onSignup: loginViewModel.onSignupUser,
      additionalSignupFields: const <UserFormField>[
        UserFormField(keyName: 'firstName', displayName: 'First Name'),
        UserFormField(keyName: 'lastName', displayName: 'Last Name'),
        UserFormField(keyName: 'birthDate', displayName: 'Birth Date'),
      ],
      onRecoverPassword: (_) => null,
      hideForgotPasswordButton: true,
      loginAfterSignUp: false,
      scrollable: true,
      messages: LoginMessages(signUpSuccess: 'User created successfully!'),
      onSubmitAnimationCompleted: () =>
          _onLoginSuccessAnimationFinished(context),
    );
  }

  void _onLoginSuccessAnimationFinished(final BuildContext context) {
    Navigator.of(context).pushReplacement<dynamic, dynamic>(
      MaterialPageRoute<HomeScreen>(
        builder: (_) => const HomeScreen(),
      ),
    );
  }
}
