// ignore_for_file: annotate_overrides

part of 'image.dart';

extension ImageRepositories on Database {
  ImageRepository get images => ImageRepository._(this);
}

abstract class ImageRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<ImageInsertRequest>,
        ModelRepositoryUpdate<ImageUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory ImageRepository._(Database db) = _ImageRepository;

  Future<ImageView?> queryImage(int id);
  Future<List<ImageView>> queryImages([QueryParams? params]);
}

class _ImageRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<ImageInsertRequest>,
        RepositoryUpdateMixin<ImageUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements ImageRepository {
  _ImageRepository(super.db) : super(tableName: 'images', keyName: 'id');

  @override
  Future<ImageView?> queryImage(int id) {
    return queryOne(id, ImageViewQueryable());
  }

  @override
  Future<List<ImageView>> queryImages([QueryParams? params]) {
    return queryMany(ImageViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<ImageInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "images" ( "file_name", "file_extension", "created_at" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.fileName)}:text, ${values.add(r.fileExtension)}:text, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<ImageUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "images"\n'
      'SET "file_name" = COALESCE(UPDATED."file_name", "images"."file_name"), "file_extension" = COALESCE(UPDATED."file_extension", "images"."file_extension"), "created_at" = COALESCE(UPDATED."created_at", "images"."created_at")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.fileName)}:text::text, ${values.add(r.fileExtension)}:text::text, ${values.add(r.createdAt)}:timestamp::timestamp )').join(', ')} )\n'
      'AS UPDATED("id", "file_name", "file_extension", "created_at")\n'
      'WHERE "images"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class ImageInsertRequest {
  ImageInsertRequest({
    required this.fileName,
    required this.fileExtension,
    required this.createdAt,
  });

  final String fileName;
  final String fileExtension;
  final DateTime createdAt;
}

class ImageUpdateRequest {
  ImageUpdateRequest({
    required this.id,
    this.fileName,
    this.fileExtension,
    this.createdAt,
  });

  final int id;
  final String? fileName;
  final String? fileExtension;
  final DateTime? createdAt;
}

class ImageViewQueryable extends KeyedViewQueryable<ImageView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "images".*'
      'FROM "images"';

  @override
  String get tableAlias => 'images';

  @override
  ImageView decode(TypedMap map) => ImageView(
      id: map.get('id'),
      fileName: map.get('file_name'),
      fileExtension: map.get('file_extension'),
      createdAt: map.get('created_at'));
}

class ImageView {
  ImageView({
    required this.id,
    required this.fileName,
    required this.fileExtension,
    required this.createdAt,
  });

  final int id;
  final String fileName;
  final String fileExtension;
  final DateTime createdAt;
}
