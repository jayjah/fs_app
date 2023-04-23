part of '../home_screen.dart';

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    super.key,
    required this.isUserLoggedIn,
  });
  final bool isUserLoggedIn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const AnimationFix(),
      body: Row(
        children: <Widget>[
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            destinations: _navigationValues
                .filter((final _NavigationValue e) =>
                    _useLoginOrProfileNavigation(e, isUserLoggedIn))
                .map<NavigationRailDestination>(
                  (final _NavigationValue e) => NavigationRailDestination(
                    icon: e.icon,
                    label: Text(e.content),
                  ),
                )
                .toList(growable: false),
            selectedIndex: null,
            onDestinationSelected: (final int newSelection) {
              _navigationValues
                  .filter((final _NavigationValue e) =>
                      _useLoginOrProfileNavigation(e, isUserLoggedIn))
                  .toList(growable: false)[newSelection]
                  .navigate(context);
            },
          ),
          const Expanded(
            key: ValueKey<String>('_anim_'),
            child: ContentAnimation(),
          ),
        ],
      ),
    );
  }
}
