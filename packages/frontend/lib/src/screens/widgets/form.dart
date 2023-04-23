part of 'widgets.dart';

typedef FormWidgetsBuilder = Iterable<Widget> Function();
typedef OnFormSuccess = FutureOr<void> Function(Map<String, dynamic> data);

class FormWidget extends StatefulWidget {
  const FormWidget({
    super.key,
    required this.formWidgetsBuilder,
    required this.onSuccess,
    this.onValidationError,
  });
  final FormWidgetsBuilder formWidgetsBuilder;
  final OnFormSuccess onSuccess;
  final VoidCallback? onValidationError;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> _formFields = <Widget>[];
  late int _hashCodeOfFormFields;
  @override
  void initState() {
    super.initState();
    final List<Widget> formWidgets = widget.formWidgetsBuilder().toList();
    _hashCodeOfFormFields = formWidgets.hashCode;
    _formFields.addAll(formWidgets);
  }

  @override
  void didUpdateWidget(covariant FormWidget oldWidget) {
    final List<Widget> formWidgets = widget.formWidgetsBuilder().toList();
    if (_hashCodeOfFormFields != formWidgets.hashCode) {
      _formFields
        ..clear()
        ..addAll(widget.formWidgetsBuilder().toList());
      _hashCodeOfFormFields = formWidgets.hashCode;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () => _formKey.currentState!.save(),
      child: SingleChildScrollView(
        padding: kPadding12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ..._formFields,
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _onSavePressed,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _onSavePressed() {
    if (_formKey.currentState?.saveAndValidate() == true) {
      widget.onSuccess(_formKey.currentState!.value);

      return;
    }
    widget.onValidationError?.call();
  }

  @override
  void dispose() {
    _formFields.clear();
    super.dispose();
  }
}
