import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/repository.dart';
import 'package:frontend/src/screens/consts.dart';
import 'package:frontend/src/screens/news_screen/state/news_bloc.dart';
import 'package:frontend/src/screens/news_screen/state/news_state.dart';
import 'package:frontend/src/screens/news_screen/widgets/form_builder_image_picker.dart';
import 'package:frontend/src/screens/widgets/widgets.dart';
import 'package:shared/shared.dart' as shared;

part 'state/news_view.dart';
part 'widgets/content.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const String routeName = '/news';
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Bloc<NewsEvent, NewsState> _newsBloc =
      NewsBloc(locator<Repository<shared.News>>());

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: 'News',
      child: NewsView(newsBloc: _newsBloc..add(const GetAllNews())),
    );
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }
}
