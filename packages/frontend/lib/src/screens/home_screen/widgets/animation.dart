part of '../home_screen.dart';

class ContentAnimation extends StatelessWidget {
  const ContentAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RiveAnimation.asset(
        'assets/anim.riv',
        placeHolder: CircularProgressIndicator.adaptive(),
        fit: BoxFit.contain,
      ),
    );
  }
}

class AnimationFix extends StatelessWidget {
  const AnimationFix({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 1,
      width: double.infinity,
      child: ColoredBox(
        color: Colors.black,
      ),
    );
  }
}
