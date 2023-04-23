// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Iterable<News> news, String? message) displaying,
    required TResult Function() showCreateForm,
    required TResult Function(News news) showUpdateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Iterable<News> news, String? message)? displaying,
    TResult? Function()? showCreateForm,
    TResult? Function(News news)? showUpdateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Iterable<News> news, String? message)? displaying,
    TResult Function()? showCreateForm,
    TResult Function(News news)? showUpdateForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Displaying value) displaying,
    required TResult Function(_Create value) showCreateForm,
    required TResult Function(_Update value) showUpdateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Displaying value)? displaying,
    TResult? Function(_Create value)? showCreateForm,
    TResult? Function(_Update value)? showUpdateForm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Displaying value)? displaying,
    TResult Function(_Create value)? showCreateForm,
    TResult Function(_Update value)? showUpdateForm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'NewsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Iterable<News> news, String? message) displaying,
    required TResult Function() showCreateForm,
    required TResult Function(News news) showUpdateForm,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Iterable<News> news, String? message)? displaying,
    TResult? Function()? showCreateForm,
    TResult? Function(News news)? showUpdateForm,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Iterable<News> news, String? message)? displaying,
    TResult Function()? showCreateForm,
    TResult Function(News news)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Displaying value) displaying,
    required TResult Function(_Create value) showCreateForm,
    required TResult Function(_Update value) showUpdateForm,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Displaying value)? displaying,
    TResult? Function(_Create value)? showCreateForm,
    TResult? Function(_Update value)? showUpdateForm,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Displaying value)? displaying,
    TResult Function(_Create value)? showCreateForm,
    TResult Function(_Update value)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NewsState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_DisplayingCopyWith<$Res> {
  factory _$$_DisplayingCopyWith(
          _$_Displaying value, $Res Function(_$_Displaying) then) =
      __$$_DisplayingCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<News> news, String? message});
}

/// @nodoc
class __$$_DisplayingCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_Displaying>
    implements _$$_DisplayingCopyWith<$Res> {
  __$$_DisplayingCopyWithImpl(
      _$_Displaying _value, $Res Function(_$_Displaying) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? message = freezed,
  }) {
    return _then(_$_Displaying(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Iterable<News>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Displaying implements _Displaying {
  const _$_Displaying({required this.news, this.message});

  @override
  final Iterable<News> news;
  @override
  final String? message;

  @override
  String toString() {
    return 'NewsState.displaying(news: $news, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Displaying &&
            const DeepCollectionEquality().equals(other.news, news) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(news), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisplayingCopyWith<_$_Displaying> get copyWith =>
      __$$_DisplayingCopyWithImpl<_$_Displaying>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Iterable<News> news, String? message) displaying,
    required TResult Function() showCreateForm,
    required TResult Function(News news) showUpdateForm,
  }) {
    return displaying(news, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Iterable<News> news, String? message)? displaying,
    TResult? Function()? showCreateForm,
    TResult? Function(News news)? showUpdateForm,
  }) {
    return displaying?.call(news, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Iterable<News> news, String? message)? displaying,
    TResult Function()? showCreateForm,
    TResult Function(News news)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (displaying != null) {
      return displaying(news, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Displaying value) displaying,
    required TResult Function(_Create value) showCreateForm,
    required TResult Function(_Update value) showUpdateForm,
  }) {
    return displaying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Displaying value)? displaying,
    TResult? Function(_Create value)? showCreateForm,
    TResult? Function(_Update value)? showUpdateForm,
  }) {
    return displaying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Displaying value)? displaying,
    TResult Function(_Create value)? showCreateForm,
    TResult Function(_Update value)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (displaying != null) {
      return displaying(this);
    }
    return orElse();
  }
}

abstract class _Displaying implements NewsState {
  const factory _Displaying(
      {required final Iterable<News> news,
      final String? message}) = _$_Displaying;

  Iterable<News> get news;
  String? get message;
  @JsonKey(ignore: true)
  _$$_DisplayingCopyWith<_$_Displaying> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create();

  @override
  String toString() {
    return 'NewsState.showCreateForm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Create);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Iterable<News> news, String? message) displaying,
    required TResult Function() showCreateForm,
    required TResult Function(News news) showUpdateForm,
  }) {
    return showCreateForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Iterable<News> news, String? message)? displaying,
    TResult? Function()? showCreateForm,
    TResult? Function(News news)? showUpdateForm,
  }) {
    return showCreateForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Iterable<News> news, String? message)? displaying,
    TResult Function()? showCreateForm,
    TResult Function(News news)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (showCreateForm != null) {
      return showCreateForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Displaying value) displaying,
    required TResult Function(_Create value) showCreateForm,
    required TResult Function(_Update value) showUpdateForm,
  }) {
    return showCreateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Displaying value)? displaying,
    TResult? Function(_Create value)? showCreateForm,
    TResult? Function(_Update value)? showUpdateForm,
  }) {
    return showCreateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Displaying value)? displaying,
    TResult Function(_Create value)? showCreateForm,
    TResult Function(_Update value)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (showCreateForm != null) {
      return showCreateForm(this);
    }
    return orElse();
  }
}

abstract class _Create implements NewsState {
  const factory _Create() = _$_Create;
}

/// @nodoc
abstract class _$$_UpdateCopyWith<$Res> {
  factory _$$_UpdateCopyWith(_$_Update value, $Res Function(_$_Update) then) =
      __$$_UpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({News news});
}

/// @nodoc
class __$$_UpdateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_Update>
    implements _$$_UpdateCopyWith<$Res> {
  __$$_UpdateCopyWithImpl(_$_Update _value, $Res Function(_$_Update) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$_Update(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
    ));
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update({required this.news});

  @override
  final News news;

  @override
  String toString() {
    return 'NewsState.showUpdateForm(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Update &&
            (identical(other.news, news) || other.news == news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, news);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      __$$_UpdateCopyWithImpl<_$_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Iterable<News> news, String? message) displaying,
    required TResult Function() showCreateForm,
    required TResult Function(News news) showUpdateForm,
  }) {
    return showUpdateForm(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Iterable<News> news, String? message)? displaying,
    TResult? Function()? showCreateForm,
    TResult? Function(News news)? showUpdateForm,
  }) {
    return showUpdateForm?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Iterable<News> news, String? message)? displaying,
    TResult Function()? showCreateForm,
    TResult Function(News news)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (showUpdateForm != null) {
      return showUpdateForm(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Displaying value) displaying,
    required TResult Function(_Create value) showCreateForm,
    required TResult Function(_Update value) showUpdateForm,
  }) {
    return showUpdateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Displaying value)? displaying,
    TResult? Function(_Create value)? showCreateForm,
    TResult? Function(_Update value)? showUpdateForm,
  }) {
    return showUpdateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Displaying value)? displaying,
    TResult Function(_Create value)? showCreateForm,
    TResult Function(_Update value)? showUpdateForm,
    required TResult orElse(),
  }) {
    if (showUpdateForm != null) {
      return showUpdateForm(this);
    }
    return orElse();
  }
}

abstract class _Update implements NewsState {
  const factory _Update({required final News news}) = _$_Update;

  News get news;
  @JsonKey(ignore: true)
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      throw _privateConstructorUsedError;
}
