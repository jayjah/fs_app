import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:frontend/src/screens/users_screen/state/users_bloc.dart';
import 'package:frontend/src/screens/users_screen/state/users_state.dart';
import 'package:frontend/src/screens/widgets/widgets.dart';
import 'package:shared/shared.dart' as shared;

part 'state/users_view.dart';
part 'widgets/content.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  static const String routeName = '/users';
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final Bloc<UsersEvent, UsersState> _usersBloc =
      UsersBloc(locator<UserRepository>());

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Users',
      child: UsersView(usersBloc: _usersBloc..add(const GetAllUsers())),
    );
  }

  @override
  void dispose() {
    _usersBloc.close();
    super.dispose();
  }
}
