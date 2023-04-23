part of 'widgets.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    required this.header,
  });
  final String header;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        header,
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop<bool>(true),
          child: const Text('Yes'),
        ),
        const SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop<bool>(false),
          child: const Text('No'),
        ),
      ],
    );
  }
}
