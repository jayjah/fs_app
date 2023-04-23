import 'package:backend/src/db/models/news.dart' as db_model_news;
import 'package:backend/src/services/type_conversion.dart';
import 'package:backend/src/services/validation/news_validation.dart';

import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

class NewsService extends NewsServiceBase {
  NewsService(this._db);
  final Database _db;
  final NewsCreateValidation _newsCreateValidation = NewsCreateValidation();
  final NewsUpdateValidation _newsUpdateValidation = NewsUpdateValidation();
  @override
  Future<News> create(ServiceCall call, CreateNews request) async {
    final GrpcError? validationError = _newsCreateValidation.validate(request);
    if (validationError != null) throw validationError;

    final int id = await _db.newses.insertOne(db_model_news.NewsInsertRequest(
      name: request.name,
      shortDescription: request.shortDescription,
      text: request.text,
      imageId: request.imageId,
      createdAt: DateTime.now(),
    ));

    return (await _db.newses.queryNews(id)).toNews();
  }

  @override
  Stream<News> getAll(ServiceCall call, AllRequest request) async* {
    final List<db_model_news.NewsView> news =
        await _db.newses.queryNewses(request.hasLimit() || request.hasOffset()
            ? QueryParams(
                limit: request.limit,
                offset: request.offset,
              )
            : null);
    // ignore: curly_braces_in_flow_control_structures
    for (final db_model_news.NewsView obj in news) yield obj.toNews();
  }

  @override
  Future<News> getOne(ServiceCall call, IdRequest request) async {
    return (await _db.newses.queryNews(request.id)).toNews();
  }

  @override
  Future<News> update(ServiceCall call, UpdateNews request) async {
    final GrpcError? validationError = _newsUpdateValidation.validate(request);
    if (validationError != null) throw validationError;

    final int id = request.id;

    await _db.newses.updateOne(db_model_news.NewsUpdateRequest(
      id: id,
      text: request.hasText() ? request.text : null,
      shortDescription:
          request.hasShortDescription() ? request.shortDescription : null,
      name: request.hasName() ? request.name : null,
      imageId: request.hasImageId() ? request.imageId : null,
    ));

    return (await _db.newses.queryNews(id)).toNews();
  }

  @override
  Future<Response> delete(ServiceCall call, IdRequest request) async {
    await _db.newses.deleteOne(request.id);

    return Response(isValid: true);
  }
}
