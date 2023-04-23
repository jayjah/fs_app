import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:frontend/src/connectivity.dart';
import 'package:frontend/src/domain/domain.dart';
import 'package:frontend/src/local_storage/local_storage.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/screens/home_screen/home_screen.dart';
import 'package:frontend/src/screens/image_screen/image_screen.dart';
import 'package:frontend/src/screens/login_screen/login_screen.dart';
import 'package:frontend/src/screens/news_screen/news_screen.dart';
import 'package:frontend/src/screens/profile_screen/profile_screen.dart';
import 'package:frontend/src/screens/users_screen/users_screen.dart';
import 'package:frontend/src/user_provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final LocalStorage<LocalUser> storage = locator<LocalStorage<LocalUser>>();

    return MaterialApp(
      title: 'Frontend',
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          primary: Colors.deepOrangeAccent,
        ),
        useMaterial3: true,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
          contentTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
        ),
      ),
      routes: <String, WidgetBuilder>{
        ImageScreen.routeName: (_) => const ImageScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        UsersScreen.routeName: (_) => const UsersScreen(),
        NewsScreen.routeName: (_) => const NewsScreen(),
      },
      builder: (BuildContext context, Widget? child) => UserProviderWidget(
        storage: storage,
        child: child ?? const SizedBox.shrink(),
      ),
      home: const Scaffold(
        body: Connectivity(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
