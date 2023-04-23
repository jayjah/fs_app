import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:frontend/src/repository/repository.dart';
import 'package:shared/shared.dart';

class NewsRepository extends Repository<News> {
  const NewsRepository(this._newsApi);
  final NewsServiceClient _newsApi;

  @override
  TaskEither<Object, News> create(News data) {
    return TaskEither<Object, News>.tryCatch(
      () => _newsApi.create(
        CreateNews(
          name: data.name,
          shortDescription: data.shortDescription,
          text: data.text,
          imageId: data.image.id,
        ),
      ),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, bool> delete(int id) {
    return TaskEither<Object, Response>.tryCatch(
      () async => await _newsApi.delete(IdRequest(id: id)),
      (Object error, StackTrace stackTrace) => error,
    ).map((Response r) => r.isValid);
  }

  @override
  TaskEither<Object, List<News>> getAll() {
    return TaskEither<Object, List<News>>.tryCatch(
      () => _newsApi.getAll(AllRequest()).toList(),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, News> getOne(int id) {
    return TaskEither<Object, News>.tryCatch(
      () => _newsApi.getOne(IdRequest(id: id)),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  TaskEither<Object, News> update(News data) {
    return TaskEither<Object, News>.tryCatch(
      () => _newsApi.update(UpdateNews(
        id: data.id,
        name: data.name,
        shortDescription: data.shortDescription,
        text: data.text,
        imageId: data.image.id,
      )),
      (Object error, StackTrace stackTrace) => error,
    );
  }

  @override
  FutureOr<void> dispose() {}
}
