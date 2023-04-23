import 'dart:async';

import 'package:frontend/src/local_storage/local_storage.dart';
import 'package:hive/hive.dart';

class HiveStorage<T> implements LocalStorage<T> {
  const HiveStorage(this._box);
  final Box<T> _box;
  @override
  FutureOr<void> delete(final String key) => _box.delete(key);

  @override
  FutureOr<T?> get(final String key) => _box.get(key);

  @override
  FutureOr<void> save(final String key, final T data) => _box.put(key, data);

  @override
  FutureOr<void> close() async => await _box.close();
}
