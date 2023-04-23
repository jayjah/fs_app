import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:frontend/src/screens/users_screen/state/users_state.dart';
import 'package:shared/shared.dart' as shared;

part 'users_event.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this._repo) : super(const UsersState.loading()) {
    on<GetAllUsers>(
      _onGetAllUsers,
      transformer: sequential(),
    );
  }

  final UserRepository _repo;

  Future<void> _onGetAllUsers(
    GetAllUsers event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersState.loading());

    await _repo
        .getAll()
        .match(
          (Object l) => emit(UsersState.displaying(
            users: const <shared.User>[],
            message: l.toString(),
          )),
          (List<shared.User> r) => emit(UsersState.displaying(users: r)),
        )
        .run();
  }
}
