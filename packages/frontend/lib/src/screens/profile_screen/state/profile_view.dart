// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures

part of '../profile_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.bloc,
  });
  final Bloc<ProfileEvent, ProfileState> bloc;

  @override
  Widget build(BuildContext context) {
    final LocalUser? localUser = UserProvider.get(context);
    if (localUser == null) return const SizedBox.shrink();

    return BlocView<Bloc<ProfileEvent, ProfileState>, ProfileState>(
      bloc: bloc,
      builder: (
        BuildContext context,
        ProfileState state,
      ) {
        return state.when(
          loading: () => const CircularProgressIndicator.adaptive(),
          error: (final String message) => Center(child: Text(message)),
          display: () => Content(
            formWidgetsBuilder: () => _buildFormWidgets(localUser),
            onFormSuccess: (final Map<String, dynamic> data) =>
                _onUpdateUser(context, data),
            onDeleteUser: () => _onDeleteUser(context),
          ),
        );
      },
    );
  }

  Future<void> _onUpdateUser(
    final BuildContext context,
    final Map<String, dynamic> data,
  ) async {
    if (await showDialog<bool>(
          context: context,
          builder: (BuildContext innerContext) => const UpdateUserDialog(),
        ) ==
        true)
      bloc.add(
        UpdateProfile(
          user: User()..buildFromMap(data, context),
          password: data['password'] as String?,
          context: context,
        ),
      );
  }

  Future<void> _onDeleteUser(final BuildContext context) async {
    if (await showDialog<bool>(
          context: context,
          builder: (BuildContext innerContext) => const LogOutDialog(),
        ) ==
        true) bloc.add(DeleteProfile(context: context));
  }

  List<Widget> _buildFormWidgets(final LocalUser user) => <Widget>[
        FormBuilderTextField(
          name: 'email',
          initialValue: user.email,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: FormBuilderValidators.email(
            errorText: 'Please enter a valid email',
          ),
        ),
        FormBuilderTextField(
          name: 'password',
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        FormBuilderTextField(
          name: 'firstName',
          initialValue: user.firstName,
          decoration: const InputDecoration(labelText: 'First Name'),
        ),
        FormBuilderTextField(
          name: 'lastName',
          initialValue: user.lastName,
          decoration: const InputDecoration(labelText: 'Last Name'),
        ),
        FormBuilderDateTimePicker(
          name: 'birthDate',
          initialValue: user.birthDate,
          initialDate: user.birthDate,
          lastDate: DateTime.now(),
          inputType: InputType.date,
          decoration: const InputDecoration(labelText: 'Birthdate'),
        ),
      ];
}

extension on User {
  void buildFromMap(
    final Map<String, dynamic> map,
    final BuildContext context,
  ) {
    final DateTime? birthDate = map['birthDate'] as DateTime?;
    final String? firstName = map['firstName'] as String?;
    final String? lastName = map['lastName'] as String?;
    final String? email = map['email'] as String?;

    id = UserProvider.get(context)!.id;
    if (birthDate != null) this.birthDate = Timestamp.fromDateTime(birthDate);
    if (firstName != null) this.firstName = firstName;
    if (lastName != null) this.lastName = lastName;
    if (email != null) this.email = email;
  }
}
