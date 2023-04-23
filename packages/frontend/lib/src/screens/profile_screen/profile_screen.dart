import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/src/domain/domain.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:frontend/src/screens/profile_screen/state/profile_bloc.dart';
import 'package:frontend/src/screens/widgets/widgets.dart';
import 'package:frontend/src/user_provider.dart';
import 'package:shared/shared.dart';

part 'state/profile_view.dart';
part 'widgets/delete_user_icon.dart';
part 'widgets/dialogs.dart';
part 'widgets/content.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Bloc<ProfileEvent, ProfileState> _profileBloc =
      ProfileBloc(locator<UserRepository>());

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Profile',
      child: ProfileView(
        bloc: _profileBloc,
      ),
    );
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }
}
