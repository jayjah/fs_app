part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {
  const NewsEvent();
}

@immutable
class GetAllNews extends NewsEvent {
  const GetAllNews();
}

@immutable
class CreateNewNewsForm extends NewsEvent {
  const CreateNewNewsForm();
}

@immutable
class UpdateNewsFormWith extends NewsEvent {
  const UpdateNewsFormWith({required this.news});
  final shared.News news;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateNewsFormWith &&
          runtimeType == other.runtimeType &&
          news == other.news;

  @override
  int get hashCode => news.hashCode;
}

@immutable
class UpdateNews extends NewsEvent {
  const UpdateNews({required this.news});
  final shared.News news;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateNews &&
          runtimeType == other.runtimeType &&
          news == other.news;

  @override
  int get hashCode => news.hashCode;
}

@immutable
class CreateNews extends NewsEvent {
  const CreateNews({required this.news});
  final shared.News news;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateNews &&
          runtimeType == other.runtimeType &&
          news == other.news;

  @override
  int get hashCode => news.hashCode;
}

@immutable
class DeleteNews extends NewsEvent {
  const DeleteNews({required this.id});
  final int id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteNews && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
