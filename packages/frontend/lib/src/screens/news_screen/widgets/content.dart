part of '../news_screen.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.allNews,
    required this.onGetAllNews,
    required this.onCreateNews,
    required this.onNewsTap,
    required this.onNewsDelete,
  });
  final List<shared.News> allNews;
  final VoidCallback onGetAllNews;
  final VoidCallback onCreateNews;
  final OnItem<shared.News>? onNewsTap;
  final OnItem<shared.News>? onNewsDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        k12Spacer,
        ElevatedButton(
          onPressed: onCreateNews,
          child: const Text('Create New News'),
        ),
        k12Spacer,
        ElevatedButton(
          onPressed: onGetAllNews,
          child: const Text('Get All News'),
        ),
        k12Spacer,
        if (allNews.isEmpty)
          const Expanded(
            child: Placeholder(),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: kPadding12,
              itemCount: allNews.length,
              itemBuilder: (BuildContext context, int index) {
                final shared.News news = allNews[index];

                return Item<shared.News>(
                  object: news,
                  onDelete: onNewsDelete,
                  onTap: onNewsTap,
                  textBuilder: (BuildContext context, shared.News news) =>
                      'News :: ${news.id} :: ${news.name} :: ${news.shortDescription} :: ${news.text} :: Image: ${news.image.id}',
                );
              },
            ),
          ),
      ],
    );
  }
}
