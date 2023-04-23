part of '../news_screen.dart';

class NewsView extends StatelessWidget {
  const NewsView({
    super.key,
    required this.newsBloc,
  });
  final Bloc<NewsEvent, NewsState> newsBloc;
  @override
  Widget build(BuildContext context) {
    return BlocView<Bloc<NewsEvent, NewsState>, NewsState>(
      bloc: newsBloc,
      builder: (BuildContext context, NewsState state) {
        return state.when(
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          displaying: (
            final Iterable<shared.News> news,
            final String? message,
          ) {
            if (message != null) context.showSnackBar(message);

            return Content(
              allNews: news.toList(),
              onCreateNews: () => newsBloc.add(const CreateNewNewsForm()),
              onGetAllNews: () => newsBloc.add(const GetAllNews()),
              onNewsDelete: (final BuildContext _, final shared.News news) =>
                  newsBloc.add(DeleteNews(id: news.id)),
              onNewsTap: (final BuildContext _, final shared.News news) =>
                  newsBloc.add(UpdateNewsFormWith(news: news)),
            );
          },
          showCreateForm: () => FormWidget(
            formWidgetsBuilder: () => _formWidgets(null),
            onSuccess: (final Map<String, dynamic> data) => newsBloc.add(
              CreateNews(news: shared.News()..buildFromMap(data)),
            ),
          ),
          showUpdateForm: (final shared.News news) => FormWidget(
            formWidgetsBuilder: () => _formWidgets(news),
            onSuccess: (final Map<String, dynamic> data) => newsBloc.add(
              UpdateNews(
                news: shared.News()
                  ..buildFromMap(data)
                  ..id = news.id,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _formWidgets(shared.News? news) => <Widget>[
        FormBuilderTextField(
          name: 'name',
          initialValue: news?.name,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        FormBuilderTextField(
          name: 'shortDescription',
          initialValue: news?.shortDescription,
          decoration: const InputDecoration(labelText: 'Short Description'),
        ),
        FormBuilderTextField(
          name: 'text',
          initialValue: news?.text,
          decoration: const InputDecoration(labelText: 'Text'),
        ),
        FormBuilderImagePicker(
          name: 'imageId',
          initialValue: news?.image.id,
          decoration: const InputDecoration(labelText: 'Image Id'),
          validator: FormBuilderValidators.required(
            errorText: 'Please choose a valid image',
          ),
        ),
      ];
}

extension on shared.News {
  void buildFromMap(
    final Map<String, dynamic> map,
  ) {
    final String? name = map['name'] as String?;
    final String? shortDescription = map['shortDescription'] as String?;
    final String? text = map['text'] as String?;
    final int? imageId = map['imageId'] as int?;

    if (name != null) this.name = name;
    if (shortDescription != null) this.shortDescription = shortDescription;
    if (text != null) this.text = text;
    if (imageId != null) image = shared.Image()..id = imageId;
  }
}
