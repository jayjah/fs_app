part of 'widgets.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Text(
          key: ValueKey<String>(title),
          title: title,
        ),
        centerTitle: true,
      ),
      body: child,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return title.isEmpty
        ? const SizedBox.shrink()
        : Text(title)
            .animate()
            .fadeIn()
            .scale()
            .move(delay: 300.ms, duration: 600.ms);
  }
}
