import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' hide Image, MetaData;
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/image_repository.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:frontend/src/screens/image_screen/state/image_bloc.dart';
import 'package:frontend/src/screens/image_screen/state/image_state.dart';
import 'package:frontend/src/screens/widgets/widgets.dart'
    show BlocView, Item, OnItem, ScreenContainer, ShowSnackbar, YesNoDialog;
import 'package:shared/shared.dart' as shared;

part 'state/image_view.dart';
part 'widgets/content.dart';
part 'widgets/dialogs.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});
  static const String routeName = 'images';
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final Bloc<ImageEvent, ImageState> _imageBloc =
      ImageBloc(locator<ImageRepository>());

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'Images',
      child: ImageView(
        imageBloc: _imageBloc..add(const GetAllImages()),
      ),
    );
  }

  @override
  void dispose() {
    _imageBloc.close();
    super.dispose();
  }
}
