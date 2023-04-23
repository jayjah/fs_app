part of '../profile_screen.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const YesNoDialog(header: 'Do you want to logout?');
  }
}

class UpdateUserDialog extends StatelessWidget {
  const UpdateUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const YesNoDialog(header: 'Update user?');
  }
}
