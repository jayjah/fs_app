part of '../profile_screen.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.formWidgetsBuilder,
    required this.onFormSuccess,
    required this.onDeleteUser,
  });

  final FormWidgetsBuilder formWidgetsBuilder;
  final OnFormSuccess onFormSuccess;
  final VoidCallback onDeleteUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DeleteUserIcon(
          onDeleteUser: onDeleteUser,
        ),
        Expanded(
          child: FormWidget(
            formWidgetsBuilder: formWidgetsBuilder,
            onSuccess: onFormSuccess,
          ),
        ),
      ],
    );
  }
}
