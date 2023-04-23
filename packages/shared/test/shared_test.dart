import 'package:shared/src/generated/user.pb.dart';
import 'package:test/test.dart';

void main() {
  group('A User', () {
    final user = User();

    setUp(() {
      // Additional setup goes here.
    });

    test('can be created', () {
      expect(user, isNotNull);
    });
  });
}
