// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:frontend/src/screens/image_screen/image_screen.dart'
    as image_screen show ImageScreen;
import 'package:frontend/src/screens/login_screen/login_screen.dart'
    as login_screen show LoginScreen;
import 'package:frontend/src/screens/news_screen/news_screen.dart'
    as news_screen show NewsScreen;
import 'package:frontend/src/screens/profile_screen/profile_screen.dart'
    as profile_screen show ProfileScreen;
import 'package:frontend/src/screens/users_screen/users_screen.dart'
    as users_screen show UsersScreen;
import 'package:frontend/src/user_provider.dart';
import 'package:rive/rive.dart';

part 'widgets/animation.dart';
part 'widgets/desktop_widget.dart';
part 'widgets/drawer_button.dart';
part 'widgets/mobile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isUserLoggedIn = UserProvider.isLoggedIn(context);
    debugPrint(
      'HomeScreen :: build :: local user: ${UserProvider.get(context)}',
    );

    return MediaQuery.of(context).size.width >= 600
        ? DesktopWidget(
            key: const ValueKey<String>('_desktop_'),
            isUserLoggedIn: isUserLoggedIn,
          )
        : MobileWidget(
            key: const ValueKey<String>('_mobile_'),
            isUserLoggedIn: isUserLoggedIn,
          );
  }
}

enum _NavigationValue {
  users('Users', Icon(Icons.account_circle_outlined)),
  news('News', Icon(Icons.newspaper_outlined)),
  images('Images', Icon(Icons.image_outlined)),
  login('Login', Icon(Icons.login)),
  profile('Profile', Icon(Icons.settings));

  const _NavigationValue(this.content, this.icon);

  final String content;
  final Icon icon;

  bool get isProfile {
    switch (this) {
      case _NavigationValue.users:
      case _NavigationValue.news:
      case _NavigationValue.images:
      case _NavigationValue.login:
        return false;
      case _NavigationValue.profile:
        return true;
    }
  }

  bool get isLogin {
    switch (this) {
      case _NavigationValue.users:
      case _NavigationValue.news:
      case _NavigationValue.images:
      case _NavigationValue.profile:
        return false;
      case _NavigationValue.login:
        return true;
    }
  }

  Future<dynamic> navigate(BuildContext context) {
    debugPrint('navigation with $this');
    switch (this) {
      case _NavigationValue.users:
        return Navigator.of(context)
            .pushNamed(users_screen.UsersScreen.routeName);
      case _NavigationValue.news:
        return Navigator.of(context)
            .pushNamed(news_screen.NewsScreen.routeName);
      case _NavigationValue.images:
        return Navigator.of(context)
            .pushNamed(image_screen.ImageScreen.routeName);
      case _NavigationValue.login:
        return Navigator.of(context)
            .pushNamed(login_screen.LoginScreen.routeName);
      case _NavigationValue.profile:
        return Navigator.of(context)
            .pushNamed(profile_screen.ProfileScreen.routeName);
    }
  }
}

const List<_NavigationValue> _navigationValues = _NavigationValue.values;

bool _useLoginOrProfileNavigation(
  final _NavigationValue e,
  final bool isUserLoggedIn,
) {
  if (isUserLoggedIn && e.isLogin) return false;
  if (!isUserLoggedIn && e.isProfile) return false;

  return true;
}
