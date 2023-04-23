part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}

@immutable
class DeleteProfile extends ProfileEvent {
  const DeleteProfile({required this.context});
  final BuildContext context;
}

@immutable
class UpdateProfile extends ProfileEvent {
  const UpdateProfile({
    required this.user,
    required this.context,
    required this.password,
  });
  final User user;
  final String? password;
  final BuildContext context;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateProfile &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          password == other.password;

  @override
  int get hashCode => user.hashCode ^ password.hashCode;
}
