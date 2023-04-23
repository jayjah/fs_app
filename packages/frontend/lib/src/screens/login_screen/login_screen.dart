import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:frontend/src/screens/home_screen/home_screen.dart';
import 'package:frontend/src/screens/widgets/widgets.dart' show ScreenContainer;
import 'package:frontend/src/user_provider.dart';
import 'package:shared/shared.dart' hide context;

part 'state/login_view_model.dart';
part 'state/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModelImpl(
      locator<UserRepository>(),
      _onLoginSuccess,
    );
  }

  void _onLoginSuccess(
    User user,
    String authToken,
  ) {
    if (!context.mounted) return;

    UserProvider.saveUser(
      context,
      user: user,
      authToken: authToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: '',
      child: LoginView(
        loginViewModel: _loginViewModel,
      ),
    );
  }
}
