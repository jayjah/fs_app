import 'package:backend/backend.dart';
import 'package:backend/src/env/env.dart';
import 'package:conduit_password_hash/conduit_password_hash.dart';
import 'package:test/test.dart';

void main() {
  test('Verify password', () {
    final PBKDF2 generator = PBKDF2();
    final String passwordHash = generator.generateBase64Key(
      'admin1',
      Env.passwordSalt,
      1000,
      32,
    );
    final String passwordHash2 = generator.generateBase64Key(
      'admin1',
      Env.passwordSalt,
      1000,
      32,
    );

    expect(passwordHash, isNotEmpty);
    expect(passwordHash2, isNotEmpty);

    expect(passwordHash == passwordHash2, true);
  });
}
