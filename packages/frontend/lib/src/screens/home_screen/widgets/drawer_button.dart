part of '../home_screen.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    super.key,
    required this.onTap,
    required this.content,
    required this.icon,
  });
  final VoidCallback onTap;
  final String content;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding12,
      child: TextButton(
        onPressed: () {
          Scaffold.of(context).closeDrawer();
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            icon,
            Text(content),
          ],
        ),
      ),
    );
  }
}
