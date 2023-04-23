part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {
  const UsersEvent();
}

@immutable
class GetAllUsers extends UsersEvent {
  const GetAllUsers();
}
