import 'dart:async' show FutureOr;

import 'package:fpdart/fpdart.dart' show TaskEither;

abstract class Repository<T> {
  const Repository();
  TaskEither<Object, List<T>> getAll();
  TaskEither<Object, T> getOne(int id);
  TaskEither<Object, T> create(T data);
  TaskEither<Object, T> update(T data);
  TaskEither<Object, bool> delete(int id);
  FutureOr<void> dispose();
}
