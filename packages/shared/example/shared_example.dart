import 'package:shared/src/generated/user.pb.dart';

void main() {
  var user = User();
  print('User valid: ${user.hasRequiredFields()}');
}
