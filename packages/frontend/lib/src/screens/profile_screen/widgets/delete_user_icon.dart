part of '../profile_screen.dart';

class DeleteUserIcon extends StatelessWidget {
  const DeleteUserIcon({
    super.key,
    required this.onDeleteUser,
  });
  final VoidCallback onDeleteUser;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const SizedBox.shrink(),
        IconButton(
          tooltip: 'Logout',
          padding: kPadding12,
          alignment: Alignment.centerRight,
          icon: const Icon(Icons.logout_outlined),
          color: Colors.red,
          onPressed: onDeleteUser,
        ),
      ],
    );
  }
}
