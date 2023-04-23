// ignore_for_file: annotate_overrides

part of 'token.dart';

extension TokenRepositories on Database {
  TokenRepository get tokens => TokenRepository._(this);
}

abstract class TokenRepository
    implements
        ModelRepository,
        ModelRepositoryInsert<TokenInsertRequest>,
        ModelRepositoryUpdate<TokenUpdateRequest>,
        ModelRepositoryDelete<String> {
  factory TokenRepository._(Database db) = _TokenRepository;

  Future<TokenView?> queryToken(String token);
  Future<List<TokenView>> queryTokens([QueryParams? params]);
}

class _TokenRepository extends BaseRepository
    with
        RepositoryInsertMixin<TokenInsertRequest>,
        RepositoryUpdateMixin<TokenUpdateRequest>,
        RepositoryDeleteMixin<String>
    implements TokenRepository {
  _TokenRepository(super.db) : super(tableName: 'tokens', keyName: 'token');

  @override
  Future<TokenView?> queryToken(String token) {
    return queryOne(token, TokenViewQueryable());
  }

  @override
  Future<List<TokenView>> queryTokens([QueryParams? params]) {
    return queryMany(TokenViewQueryable(), params);
  }

  @override
  Future<void> insert(List<TokenInsertRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'INSERT INTO "tokens" ( "token", "created_at" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.token)}:text, ${values.add(r.createdAt)}:timestamp )').join(', ')}\n',
      values.values,
    );
  }

  @override
  Future<void> update(List<TokenUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "tokens"\n'
      'SET "created_at" = COALESCE(UPDATED."created_at", "tokens"."created_at")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.token)}:text::text, ${values.add(r.createdAt)}:timestamp::timestamp )').join(', ')} )\n'
      'AS UPDATED("token", "created_at")\n'
      'WHERE "tokens"."token" = UPDATED."token"',
      values.values,
    );
  }
}

class TokenInsertRequest {
  TokenInsertRequest({
    required this.token,
    required this.createdAt,
  });

  final String token;
  final DateTime createdAt;
}

class TokenUpdateRequest {
  TokenUpdateRequest({
    required this.token,
    this.createdAt,
  });

  final String token;
  final DateTime? createdAt;
}

class TokenViewQueryable extends KeyedViewQueryable<TokenView, String> {
  @override
  String get keyName => 'token';

  @override
  String encodeKey(String key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "tokens".*'
      'FROM "tokens"';

  @override
  String get tableAlias => 'tokens';

  @override
  TokenView decode(TypedMap map) =>
      TokenView(token: map.get('token'), createdAt: map.get('created_at'));
}

class TokenView {
  TokenView({
    required this.token,
    required this.createdAt,
  });

  final String token;
  final DateTime createdAt;
}
