part of 'widgets.dart';

typedef OnItem<T> = void Function(BuildContext context, T object);
typedef TextBuilder<T> = String Function(BuildContext context, T object);

class Item<T> extends StatelessWidget {
  const Item({
    super.key,
    required this.object,
    required this.onDelete,
    required this.onTap,
    required this.textBuilder,
  });
  final T object;
  final OnItem<T>? onDelete;
  final OnItem<T>? onTap;
  final TextBuilder<T> textBuilder;
  static const Widget _dismissibleBackground = ColoredBox(
    color: Colors.redAccent,
    child: Icon(Icons.delete_forever_outlined),
  );
  @override
  Widget build(BuildContext context) {
    late final Widget child = Center(
      child: TextButton(
        onPressed: () => onTap?.call(context, object),
        child: Text(textBuilder(context, object)),
      ),
    );

    return onDelete == null
        ? child
        : Dismissible(
            key: ValueKey<int>(object.hashCode),
            background: _dismissibleBackground,
            confirmDismiss: (_) async =>
                await showDialog<bool>(
                  context: context,
                  builder: (BuildContext innerContext) =>
                      const YesNoDialog(header: 'Do you want to delete it?'),
                ) ==
                true,
            onDismissed: (_) => onDelete!(context, object),
            child: child,
          );
  }
}
