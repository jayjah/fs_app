import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/image_repository.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart' as shared;

/// Field for `Date`, `Time` and `DateTime` input
class FormBuilderImagePicker extends FormBuilderField<int> {
  /// For representing the date as a string e.g.
  /// `DateFormat("EEEE, MMMM d, yyyy 'at' h:mma")`
  /// (Sunday, June 3, 2018 at 9:24pm)
  final DateFormat? format;

  /// The date the calendar opens to when displayed. Defaults to the current date.
  ///
  /// To preset the widget's value, use [initialValue] instead.
  final DateTime? initialDate;

  /// The earliest choosable date. Defaults to 1900.
  final DateTime? firstDate;

  /// The latest choosable date. Defaults to 2100.
  final DateTime? lastDate;

  final DateTime? currentDate;

  /// The initial time prefilled in the picker dialog when it is shown. Defaults
  /// to noon. Explicitly set this to `null` to use the current time.
  final TimeOfDay initialTime;

  @Deprecated(
    'This property is no used anymore. Please use decoration.suffixIcon to set your desired icon',
  )
  final Widget? resetIcon;

  /// Called when an enclosing form is saved. The value passed will be `null`
  /// if [format] fails to parse the text.
  // final FormFieldSetter<DateTime> onSaved;

  /// Corresponds to the [showDatePicker()] parameter. Defaults to
  /// [DatePickerMode.day].
  final DatePickerMode initialDatePickerMode;

  /// Corresponds to the [showDatePicker()] parameter.
  ///
  /// See [GlobalMaterialLocalizations](https://docs.flutter.io/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html)
  /// for acceptable values.
  final Locale? locale;

  /// Corresponds to the [showDatePicker()] parameter.
  final ui.TextDirection? textDirection;

  /// Corresponds to the [showDatePicker()] parameter.
  final bool useRootNavigator;

  /// Called when an enclosing form is submitted. The value passed will be
  /// `null` if [format] fails to parse the text.
  final ValueChanged<DateTime?>? onFieldSubmitted;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;

  /// Preset the widget's value.
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final MaxLengthEnforcement maxLengthEnforcement;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TransitionBuilder? transitionBuilder;

  /// Called whenever the state's value changes, e.g. after picker value(s)
  /// have been selected or when the field loses focus. To listen for all text
  /// changes, use the [controller] and [focusNode].
  // final ValueChanged<DateTime> onChanged;

  final bool showCursor;

  final int? minLines;

  final bool expands;

  final TextInputAction? textInputAction;

  final VoidCallback? onEditingComplete;

  final InputCounterWidgetBuilder? buildCounter;

  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;

  final double cursorWidth;
  final TextCapitalization textCapitalization;

  final String? cancelText;
  final String? confirmText;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  final String? helpText;
  final DatePickerEntryMode initialEntryMode;
  final RouteSettings? routeSettings;

  final TimePickerEntryMode timePickerInitialEntryMode;
  final StrutStyle? strutStyle;
  final SelectableDayPredicate? selectableDayPredicate;
  final Offset? anchorPoint;
  final EntryModeChangeCallback? onEntryModeChanged;

  /// Creates field for `Date`, `Time` and `DateTime` input
  FormBuilderImagePicker({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.decoration,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.cursorWidth = 2.0,
    this.enableInteractiveSelection = true,
    this.resetIcon = const Icon(Icons.close),
    this.initialTime = const TimeOfDay(hour: 12, minute: 0),
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.expands = false,
    this.initialDatePickerMode = DatePickerMode.day,
    this.transitionBuilder,
    this.textCapitalization = TextCapitalization.none,
    this.useRootNavigator = true,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.timePickerInitialEntryMode = TimePickerEntryMode.dial,
    this.format,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.locale,
    this.maxLength,
    this.textDirection,
    this.textAlignVertical,
    this.onFieldSubmitted,
    this.controller,
    this.style,
    this.maxLengthEnforcement = MaxLengthEnforcement.none,
    this.inputFormatters,
    this.showCursor = false,
    this.minLines,
    this.textInputAction,
    this.onEditingComplete,
    this.buildCounter,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.cancelText,
    this.confirmText,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.helpText,
    this.routeSettings,
    this.strutStyle,
    this.selectableDayPredicate,
    this.anchorPoint,
    this.onEntryModeChanged,
  }) : super(
          builder: (FormFieldState<int?> field) {
            final _FormBuilderDateTimePickerState state =
                field as _FormBuilderDateTimePickerState;

            return TextField(
              textDirection: textDirection,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              maxLength: maxLength,
              autofocus: autofocus,
              decoration: state.decoration,
              readOnly: true,
              enabled: state.enabled,
              autocorrect: autocorrect,
              controller: state._textFieldController,
              focusNode: state.effectiveFocusNode,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              maxLines: maxLines,
              obscureText: obscureText,
              showCursor: showCursor,
              minLines: minLines,
              expands: expands,
              style: style,
              onEditingComplete: onEditingComplete,
              buildCounter: buildCounter,
              cursorColor: cursorColor,
              cursorRadius: cursorRadius,
              cursorWidth: cursorWidth,
              enableInteractiveSelection: enableInteractiveSelection,
              keyboardAppearance: keyboardAppearance,
              scrollPadding: scrollPadding,
              strutStyle: strutStyle,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              maxLengthEnforcement: maxLengthEnforcement,
            );
          },
        );

  @override
  FormBuilderFieldState<FormBuilderImagePicker, int> createState() =>
      _FormBuilderDateTimePickerState();
}

class _FormBuilderDateTimePickerState
    extends FormBuilderFieldState<FormBuilderImagePicker, int> {
  late TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = widget.controller ?? TextEditingController();
    //setting this to value instead of initialValue here is OK since we handle initial value in the parent class
    final String? initVal = value?.toString();
    _textFieldController.text = initVal == null ? '' : initialValue!.toString();
    effectiveFocusNode.addListener(_handleFocus);
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_handleFocus);
    // Dispose the _textFieldController when initState created it
    if (null == widget.controller) {
      _textFieldController.dispose();
    }
    super.dispose();
  }

  Future<void> _handleFocus() async {
    if (effectiveFocusNode.hasFocus && enabled) {
      effectiveFocusNode.unfocus();
      await onShowPicker(context, value);
    }
  }

  Future<int?> onShowPicker(
    BuildContext context,
    int? currentValue,
  ) async {
    // ignore: parameter_assignments
    currentValue = value;
    int? newValue;

    newValue = await (await locator<ImageRepository>()
        .getAll()
        .match(
          (Object l) => null,
          _showDialog,
        )
        .run());

    final int? finalValue = newValue ?? currentValue;
    didChange(finalValue);

    return finalValue;
  }

  Future<int?> _showDialog(List<shared.Image> images) {
    return showDialog<int?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Column(
            children: <Widget>[
              for (final shared.Image image in images)
                Padding(
                  padding: kPadding8,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(image.id),
                    child: Text(image.file.metaData.fileName),
                  ),
                ),
              Padding(
                padding: kPadding8,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(null),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void didChange(int? value) {
    super.didChange(value);
    _textFieldController.text = (value == null) ? '' : value.toString();
  }
}
