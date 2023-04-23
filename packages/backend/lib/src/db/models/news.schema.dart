// ignore_for_file: annotate_overrides

part of 'news.dart';

extension NewsRepositories on Database {
  NewsRepository get newses => NewsRepository._(this);
}

abstract class NewsRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<NewsInsertRequest>,
        ModelRepositoryUpdate<NewsUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory NewsRepository._(Database db) = _NewsRepository;

  Future<NewsView?> queryNews(int id);
  Future<List<NewsView>> queryNewses([QueryParams? params]);
}

class _NewsRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<NewsInsertRequest>,
        RepositoryUpdateMixin<NewsUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements NewsRepository {
  _NewsRepository(super.db) : super(tableName: 'news', keyName: 'id');

  @override
  Future<NewsView?> queryNews(int id) {
    return queryOne(id, NewsViewQueryable());
  }

  @override
  Future<List<NewsView>> queryNewses([QueryParams? params]) {
    return queryMany(NewsViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<NewsInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "news" ( "name", "short_description", "text", "image_id", "created_at" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.name)}:text, ${values.add(r.shortDescription)}:text, ${values.add(r.text)}:text, ${values.add(r.imageId)}:int8, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<NewsUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "news"\n'
      'SET "name" = COALESCE(UPDATED."name", "news"."name"), "short_description" = COALESCE(UPDATED."short_description", "news"."short_description"), "text" = COALESCE(UPDATED."text", "news"."text"), "image_id" = COALESCE(UPDATED."image_id", "news"."image_id"), "created_at" = COALESCE(UPDATED."created_at", "news"."created_at")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.name)}:text::text, ${values.add(r.shortDescription)}:text::text, ${values.add(r.text)}:text::text, ${values.add(r.imageId)}:int8::int8, ${values.add(r.createdAt)}:timestamp::timestamp )').join(', ')} )\n'
      'AS UPDATED("id", "name", "short_description", "text", "image_id", "created_at")\n'
      'WHERE "news"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class NewsInsertRequest {
  NewsInsertRequest({
    required this.name,
    required this.shortDescription,
    required this.text,
    this.imageId,
    required this.createdAt,
  });

  final String name;
  final String shortDescription;
  final String text;
  final int? imageId;
  final DateTime createdAt;
}

class NewsUpdateRequest {
  NewsUpdateRequest({
    required this.id,
    this.name,
    this.shortDescription,
    this.text,
    this.imageId,
    this.createdAt,
  });

  final int id;
  final String? name;
  final String? shortDescription;
  final String? text;
  final int? imageId;
  final DateTime? createdAt;
}

class NewsViewQueryable extends KeyedViewQueryable<NewsView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "news".*, row_to_json("image".*) as "image"'
      'FROM "news"'
      'LEFT JOIN (${ImageViewQueryable().query}) "image"'
      'ON "news"."image_id" = "image"."id"';

  @override
  String get tableAlias => 'news';

  @override
  NewsView decode(TypedMap map) => NewsView(
      id: map.get('id'),
      name: map.get('name'),
      shortDescription: map.get('short_description'),
      text: map.get('text'),
      image: map.getOpt('image', ImageViewQueryable().decoder),
      createdAt: map.get('created_at'));
}

class NewsView {
  NewsView({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.text,
    this.image,
    required this.createdAt,
  });

  final int id;
  final String name;
  final String shortDescription;
  final String text;
  final ImageView? image;
  final DateTime createdAt;
}
