// ignore_for_file: curly_braces_in_flow_control_structures

part of '../users_screen.dart';

class UsersView extends StatelessWidget {
  const UsersView({
    super.key,
    required this.usersBloc,
  });
  final Bloc<UsersEvent, UsersState> usersBloc;
  @override
  Widget build(BuildContext context) {
    return BlocView<Bloc<UsersEvent, UsersState>, UsersState>(
      bloc: usersBloc,
      builder: (BuildContext context, UsersState state) {
        return state.when(
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          displaying: (
            final Iterable<shared.User> users,
            final String? message,
          ) {
            if (message != null) context.showSnackBar(message);

            return Content(
              allUsers: users.toList(),
              onGetAllUsers: () => usersBloc.add(const GetAllUsers()),
            );
          },
        );
      },
    );
  }
}
