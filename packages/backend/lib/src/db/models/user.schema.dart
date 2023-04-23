// ignore_for_file: annotate_overrides

part of 'user.dart';

extension UserRepositories on Database {
  UserRepository get users => UserRepository._(this);
}

abstract class UserRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<UserInsertRequest>,
        ModelRepositoryUpdate<UserUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory UserRepository._(Database db) = _UserRepository;

  Future<UserView?> queryUser(int id);
  Future<List<UserView>> queryUsers([QueryParams? params]);
}

class _UserRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<UserInsertRequest>,
        RepositoryUpdateMixin<UserUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements UserRepository {
  _UserRepository(super.db) : super(tableName: 'users', keyName: 'id');

  @override
  Future<UserView?> queryUser(int id) {
    return queryOne(id, UserViewQueryable());
  }

  @override
  Future<List<UserView>> queryUsers([QueryParams? params]) {
    return queryMany(UserViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<UserInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "users" ( "first_name", "last_name", "email", "password", "birth_date" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.firstName)}:text, ${values.add(r.lastName)}:text, ${values.add(r.email)}:text, ${values.add(r.password)}:text, ${values.add(r.birthDate)}:timestamp )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<UserUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "users"\n'
      'SET "first_name" = COALESCE(UPDATED."first_name", "users"."first_name"), "last_name" = COALESCE(UPDATED."last_name", "users"."last_name"), "email" = COALESCE(UPDATED."email", "users"."email"), "password" = COALESCE(UPDATED."password", "users"."password"), "birth_date" = COALESCE(UPDATED."birth_date", "users"."birth_date")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.firstName)}:text::text, ${values.add(r.lastName)}:text::text, ${values.add(r.email)}:text::text, ${values.add(r.password)}:text::text, ${values.add(r.birthDate)}:timestamp::timestamp )').join(', ')} )\n'
      'AS UPDATED("id", "first_name", "last_name", "email", "password", "birth_date")\n'
      'WHERE "users"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class UserInsertRequest {
  UserInsertRequest({
    this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    this.birthDate,
  });

  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final DateTime? birthDate;
}

class UserUpdateRequest {
  UserUpdateRequest({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.birthDate,
  });

  final int id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final DateTime? birthDate;
}

class UserViewQueryable extends KeyedViewQueryable<UserView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "users".*'
      'FROM "users"';

  @override
  String get tableAlias => 'users';

  @override
  UserView decode(TypedMap map) => UserView(
      id: map.get('id'),
      firstName: map.getOpt('first_name'),
      lastName: map.getOpt('last_name'),
      email: map.get('email'),
      password: map.get('password'),
      birthDate: map.getOpt('birth_date'));
}

class UserView {
  UserView({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.password,
    this.birthDate,
  });

  final int id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final DateTime? birthDate;
}
