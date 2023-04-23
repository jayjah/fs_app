import 'package:fpdart/fpdart.dart';
import 'package:shared/shared.dart';

class StatusRepository {
  const StatusRepository(this._statusApi);
  final StatusServiceClient _statusApi;

  TaskEither<Object, Status> status() {
    return TaskEither<Object, Status>.tryCatch(
      () => _statusApi.ping(StatusRequest()),
      (Object error, StackTrace stackTrace) => error,
    );
  }
}
