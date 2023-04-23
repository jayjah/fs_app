import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/repository/repository.dart';
import 'package:frontend/src/screens/news_screen/state/news_state.dart';
import 'package:shared/shared.dart' as shared;

part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._repo) : super(const NewsState.loading()) {
    this
      ..on<GetAllNews>(
        _onGetAllNews,
        transformer: sequential(),
      )
      ..on<CreateNewNewsForm>(
        _onShowCreateNewsForm,
        transformer: sequential(),
      )
      ..on<UpdateNewsFormWith>(
        _onShowUpdateNewsForm,
        transformer: sequential(),
      )
      ..on<CreateNews>(
        _onCreateNews,
        transformer: sequential(),
      )
      ..on<UpdateNews>(
        _onUpdateNews,
        transformer: sequential(),
      )
      ..on<DeleteNews>(
        _onDeleteNews,
        transformer: sequential(),
      );
  }

  final Repository<shared.News> _repo;
  final List<shared.News> _allNews = <shared.News>[];

  Future<void> _onDeleteNews(
    DeleteNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());

    await _repo.delete(event.id).match(
      (Object l) => emit(NewsState.displaying(
        news: const <shared.News>[],
        message: l.toString(),
      )),
      (bool success) {
        if (success)
          // ignore: curly_braces_in_flow_control_structures
          _allNews.removeWhere((shared.News element) => element.id == event.id);

        emit(NewsState.displaying(news: _allNews));
      },
    ).run();
  }

  Future<void> _onCreateNews(
    CreateNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());

    await _repo
        .create(event.news)
        .match(
          (Object l) => emit(NewsState.displaying(
            news: const <shared.News>[],
            message: l.toString(),
          )),
          (shared.News r) => emit(NewsState.displaying(news: _allNews..add(r))),
        )
        .run();
  }

  Future<void> _onUpdateNews(
    UpdateNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());

    await _repo
        .update(event.news)
        .match(
          (Object l) => emit(NewsState.displaying(
            news: const <shared.News>[],
            message: l.toString(),
          )),
          (shared.News r) => emit(NewsState.displaying(
            news: _allNews
              ..removeWhere(
                (final shared.News element) => element.id == event.news.id,
              )
              ..add(r),
          )),
        )
        .run();
  }

  Future<void> _onShowUpdateNewsForm(
    UpdateNewsFormWith event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsState.showUpdateForm(news: event.news));
  }

  Future<void> _onShowCreateNewsForm(
    CreateNewNewsForm event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.showCreateForm());
  }

  Future<void> _onGetAllNews(GetAllNews event, Emitter<NewsState> emit) async {
    emit(const NewsState.loading());

    await _repo
        .getAll()
        .match(
          (Object l) => emit(NewsState.displaying(
            news: const <shared.News>[],
            message: l.toString(),
          )),
          (List<shared.News> r) => emit(
            NewsState.displaying(
              news: _allNews
                ..clear()
                ..addAll(r),
            ),
          ),
        )
        .run();
  }
}
