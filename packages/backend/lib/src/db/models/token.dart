// This file is "model.dart"
import 'package:shared/shared.dart' show kTokenValidInDays;
import 'package:stormberry/stormberry.dart';

// Will be generated by stormberry
part 'token.schema.dart';

@Model(
  tableName: 'tokens',
  indexes: <TableIndex>[
    TableIndex(
      name: 'token',
      columns: <String>['token'],
      unique: true,
    ),
  ],
)
abstract class Token {
  @PrimaryKey()
  String get token;
  DateTime get createdAt;
}

extension UserValidation on TokenRepository {
  Future<bool> isTokenValid(final String authTokenFromHeader) async {
    final TokenView? dbToken = await queryToken(authTokenFromHeader);
    if (dbToken == null) return false;

    return dbToken.createdAt.difference(DateTime.now()).abs().inDays <=
        kTokenValidInDays;
  }
}