part of '../home_screen.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({
    super.key,
    required this.isUserLoggedIn,
  });
  final bool isUserLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomSheet: const AnimationFix(),
      body: const ContentAnimation(
        key: ValueKey<String>('_anim_'),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: _navigationValues
                .filter((final _NavigationValue e) =>
                    _useLoginOrProfileNavigation(e, isUserLoggedIn))
                .map<DrawerButton>(
                  (final _NavigationValue e) => DrawerButton(
                    onTap: () => e.navigate(context),
                    content: e.content,
                    icon: e.icon,
                  ),
                )
                .toList(growable: false),
          ),
        ),
      ),
    );
  }
}
