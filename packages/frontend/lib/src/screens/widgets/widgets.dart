library widgets;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show
        BlocBase,
        BlocProvider,
        BlocBuilder,
        BlocListener,
        BlocWidgetListener,
        BlocListenerCondition;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/src/screens/consts.dart';

part 'bloc_view.dart';
part 'form.dart';
part 'screen_container.dart';
part 'yes_no_dialog.dart';
part 'item.dart';

extension ShowSnackbar on BuildContext {
  Future<void> showSnackBar(
    final String content,
  ) =>
      Future<void>.microtask(() {
        if (!mounted) return;

        ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
        ));
      });
}
