import 'dart:async';

abstract class LocalStorage<T> {
  FutureOr<void> save(final String key, final T data);
  FutureOr<T?> get(final String key);
  FutureOr<void> delete(final String key);
  FutureOr<void> close();
}
