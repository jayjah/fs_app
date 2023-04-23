part of 'widgets.dart';

typedef WidgetForStateBuilder<S> = Widget Function(
  BuildContext context,
  S state,
);

class BlocView<B extends BlocBase<S>, S> extends StatelessWidget {
  const BlocView({
    super.key,
    required this.builder,
    required this.bloc,
  });
  final WidgetForStateBuilder<S> builder;
  final B bloc;
  static Widget withListener<B extends BlocBase<S>, S>({
    required B bloc,
    required WidgetForStateBuilder<S> builder,
    required BlocWidgetListener<S> listener,
    BlocListenerCondition<S>? listenWhen,
  }) =>
      _ViewWithListener<B, S>(
        listener: listener,
        listenWhen: listenWhen,
        builder: builder,
        bloc: bloc,
      );

  @override
  Widget build(BuildContext context) {
    return _View<B, S>(
      builder: builder,
      bloc: bloc,
    );
  }
}

class _View<B extends BlocBase<S>, S> extends StatelessWidget {
  const _View({super.key, required this.builder, required this.bloc});
  final WidgetForStateBuilder<S> builder;
  final B bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>.value(
      value: bloc,
      child: BlocBuilder<B, S>(
        builder: builder,
      ),
    );
  }
}

class _ViewWithListener<B extends BlocBase<S>, S> extends StatelessWidget {
  const _ViewWithListener({
    super.key,
    required this.builder,
    required this.bloc,
    required this.listener,
    this.listenWhen,
  });
  final WidgetForStateBuilder<S> builder;
  final BlocWidgetListener<S> listener;
  final BlocListenerCondition<S>? listenWhen;
  final B bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>.value(
      value: bloc,
      child: BlocListener<B, S>(
        bloc: bloc,
        listenWhen: listenWhen,
        listener: listener,
        child: BlocBuilder<B, S>(
          builder: builder,
        ),
      ),
    );
  }
}
