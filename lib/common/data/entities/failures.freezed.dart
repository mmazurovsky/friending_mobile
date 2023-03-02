// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestFailure {
  FailureMessages get m => throw _privateConstructorUsedError;
  Exception? get e => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FailureMessages m, Exception? e) server,
    required TResult Function(FailureMessages m, Exception? e) undefined,
    required TResult Function(FailureMessages m, Exception? e) client,
    required TResult Function(FailureMessages m, Exception? e) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FailureMessages m, Exception? e)? server,
    TResult? Function(FailureMessages m, Exception? e)? undefined,
    TResult? Function(FailureMessages m, Exception? e)? client,
    TResult? Function(FailureMessages m, Exception? e)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FailureMessages m, Exception? e)? server,
    TResult Function(FailureMessages m, Exception? e)? undefined,
    TResult Function(FailureMessages m, Exception? e)? client,
    TResult Function(FailureMessages m, Exception? e)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(UndefinedFailure value) undefined,
    required TResult Function(ClientFailure value) client,
    required TResult Function(AuthFailure value) auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UndefinedFailure value)? undefined,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(AuthFailure value)? auth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(UndefinedFailure value)? undefined,
    TResult Function(ClientFailure value)? client,
    TResult Function(AuthFailure value)? auth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestFailureCopyWith<RequestFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFailureCopyWith<$Res> {
  factory $RequestFailureCopyWith(
          RequestFailure value, $Res Function(RequestFailure) then) =
      _$RequestFailureCopyWithImpl<$Res, RequestFailure>;
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class _$RequestFailureCopyWithImpl<$Res, $Val extends RequestFailure>
    implements $RequestFailureCopyWith<$Res> {
  _$RequestFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_value.copyWith(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureCopyWith<$Res>
    implements $RequestFailureCopyWith<$Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure value, $Res Function(_$ServerFailure) then) =
      __$$ServerFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res, _$ServerFailure>
    implements _$$ServerFailureCopyWith<$Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure _value, $Res Function(_$ServerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$ServerFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ServerFailure extends ServerFailure {
  _$ServerFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'RequestFailure.server(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      __$$ServerFailureCopyWithImpl<_$ServerFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FailureMessages m, Exception? e) server,
    required TResult Function(FailureMessages m, Exception? e) undefined,
    required TResult Function(FailureMessages m, Exception? e) client,
    required TResult Function(FailureMessages m, Exception? e) auth,
  }) {
    return server(m, e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FailureMessages m, Exception? e)? server,
    TResult? Function(FailureMessages m, Exception? e)? undefined,
    TResult? Function(FailureMessages m, Exception? e)? client,
    TResult? Function(FailureMessages m, Exception? e)? auth,
  }) {
    return server?.call(m, e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FailureMessages m, Exception? e)? server,
    TResult Function(FailureMessages m, Exception? e)? undefined,
    TResult Function(FailureMessages m, Exception? e)? client,
    TResult Function(FailureMessages m, Exception? e)? auth,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(m, e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(UndefinedFailure value) undefined,
    required TResult Function(ClientFailure value) client,
    required TResult Function(AuthFailure value) auth,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UndefinedFailure value)? undefined,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(AuthFailure value)? auth,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(UndefinedFailure value)? undefined,
    TResult Function(ClientFailure value)? client,
    TResult Function(AuthFailure value)? auth,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends RequestFailure {
  factory ServerFailure(
      {required final FailureMessages m, final Exception? e}) = _$ServerFailure;
  ServerFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndefinedFailureCopyWith<$Res>
    implements $RequestFailureCopyWith<$Res> {
  factory _$$UndefinedFailureCopyWith(
          _$UndefinedFailure value, $Res Function(_$UndefinedFailure) then) =
      __$$UndefinedFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$UndefinedFailureCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res, _$UndefinedFailure>
    implements _$$UndefinedFailureCopyWith<$Res> {
  __$$UndefinedFailureCopyWithImpl(
      _$UndefinedFailure _value, $Res Function(_$UndefinedFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$UndefinedFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$UndefinedFailure extends UndefinedFailure {
  _$UndefinedFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'RequestFailure.undefined(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndefinedFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UndefinedFailureCopyWith<_$UndefinedFailure> get copyWith =>
      __$$UndefinedFailureCopyWithImpl<_$UndefinedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FailureMessages m, Exception? e) server,
    required TResult Function(FailureMessages m, Exception? e) undefined,
    required TResult Function(FailureMessages m, Exception? e) client,
    required TResult Function(FailureMessages m, Exception? e) auth,
  }) {
    return undefined(m, e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FailureMessages m, Exception? e)? server,
    TResult? Function(FailureMessages m, Exception? e)? undefined,
    TResult? Function(FailureMessages m, Exception? e)? client,
    TResult? Function(FailureMessages m, Exception? e)? auth,
  }) {
    return undefined?.call(m, e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FailureMessages m, Exception? e)? server,
    TResult Function(FailureMessages m, Exception? e)? undefined,
    TResult Function(FailureMessages m, Exception? e)? client,
    TResult Function(FailureMessages m, Exception? e)? auth,
    required TResult orElse(),
  }) {
    if (undefined != null) {
      return undefined(m, e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(UndefinedFailure value) undefined,
    required TResult Function(ClientFailure value) client,
    required TResult Function(AuthFailure value) auth,
  }) {
    return undefined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UndefinedFailure value)? undefined,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(AuthFailure value)? auth,
  }) {
    return undefined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(UndefinedFailure value)? undefined,
    TResult Function(ClientFailure value)? client,
    TResult Function(AuthFailure value)? auth,
    required TResult orElse(),
  }) {
    if (undefined != null) {
      return undefined(this);
    }
    return orElse();
  }
}

abstract class UndefinedFailure extends RequestFailure {
  factory UndefinedFailure(
      {required final FailureMessages m,
      final Exception? e}) = _$UndefinedFailure;
  UndefinedFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$UndefinedFailureCopyWith<_$UndefinedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientFailureCopyWith<$Res>
    implements $RequestFailureCopyWith<$Res> {
  factory _$$ClientFailureCopyWith(
          _$ClientFailure value, $Res Function(_$ClientFailure) then) =
      __$$ClientFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$ClientFailureCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res, _$ClientFailure>
    implements _$$ClientFailureCopyWith<$Res> {
  __$$ClientFailureCopyWithImpl(
      _$ClientFailure _value, $Res Function(_$ClientFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$ClientFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ClientFailure extends ClientFailure {
  _$ClientFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'RequestFailure.client(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientFailureCopyWith<_$ClientFailure> get copyWith =>
      __$$ClientFailureCopyWithImpl<_$ClientFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FailureMessages m, Exception? e) server,
    required TResult Function(FailureMessages m, Exception? e) undefined,
    required TResult Function(FailureMessages m, Exception? e) client,
    required TResult Function(FailureMessages m, Exception? e) auth,
  }) {
    return client(m, e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FailureMessages m, Exception? e)? server,
    TResult? Function(FailureMessages m, Exception? e)? undefined,
    TResult? Function(FailureMessages m, Exception? e)? client,
    TResult? Function(FailureMessages m, Exception? e)? auth,
  }) {
    return client?.call(m, e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FailureMessages m, Exception? e)? server,
    TResult Function(FailureMessages m, Exception? e)? undefined,
    TResult Function(FailureMessages m, Exception? e)? client,
    TResult Function(FailureMessages m, Exception? e)? auth,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(m, e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(UndefinedFailure value) undefined,
    required TResult Function(ClientFailure value) client,
    required TResult Function(AuthFailure value) auth,
  }) {
    return client(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UndefinedFailure value)? undefined,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(AuthFailure value)? auth,
  }) {
    return client?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(UndefinedFailure value)? undefined,
    TResult Function(ClientFailure value)? client,
    TResult Function(AuthFailure value)? auth,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(this);
    }
    return orElse();
  }
}

abstract class ClientFailure extends RequestFailure {
  factory ClientFailure(
      {required final FailureMessages m, final Exception? e}) = _$ClientFailure;
  ClientFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$ClientFailureCopyWith<_$ClientFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureCopyWith<$Res>
    implements $RequestFailureCopyWith<$Res> {
  factory _$$AuthFailureCopyWith(
          _$AuthFailure value, $Res Function(_$AuthFailure) then) =
      __$$AuthFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$AuthFailureCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res, _$AuthFailure>
    implements _$$AuthFailureCopyWith<$Res> {
  __$$AuthFailureCopyWithImpl(
      _$AuthFailure _value, $Res Function(_$AuthFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$AuthFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$AuthFailure extends AuthFailure {
  _$AuthFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'RequestFailure.auth(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureCopyWith<_$AuthFailure> get copyWith =>
      __$$AuthFailureCopyWithImpl<_$AuthFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FailureMessages m, Exception? e) server,
    required TResult Function(FailureMessages m, Exception? e) undefined,
    required TResult Function(FailureMessages m, Exception? e) client,
    required TResult Function(FailureMessages m, Exception? e) auth,
  }) {
    return auth(m, e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FailureMessages m, Exception? e)? server,
    TResult? Function(FailureMessages m, Exception? e)? undefined,
    TResult? Function(FailureMessages m, Exception? e)? client,
    TResult? Function(FailureMessages m, Exception? e)? auth,
  }) {
    return auth?.call(m, e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FailureMessages m, Exception? e)? server,
    TResult Function(FailureMessages m, Exception? e)? undefined,
    TResult Function(FailureMessages m, Exception? e)? client,
    TResult Function(FailureMessages m, Exception? e)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(m, e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(UndefinedFailure value) undefined,
    required TResult Function(ClientFailure value) client,
    required TResult Function(AuthFailure value) auth,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(UndefinedFailure value)? undefined,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(AuthFailure value)? auth,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(UndefinedFailure value)? undefined,
    TResult Function(ClientFailure value)? client,
    TResult Function(AuthFailure value)? auth,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthFailure extends RequestFailure {
  factory AuthFailure({required final FailureMessages m, final Exception? e}) =
      _$AuthFailure;
  AuthFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$AuthFailureCopyWith<_$AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CacheFailure {
  FailureMessages get m => throw _privateConstructorUsedError;
  Exception? get e => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CacheFailureCopyWith<CacheFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheFailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(
          CacheFailure value, $Res Function(CacheFailure) then) =
      _$CacheFailureCopyWithImpl<$Res, CacheFailure>;
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class _$CacheFailureCopyWithImpl<$Res, $Val extends CacheFailure>
    implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_value.copyWith(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CacheFailureCopyWith<$Res>
    implements $CacheFailureCopyWith<$Res> {
  factory _$$_CacheFailureCopyWith(
          _$_CacheFailure value, $Res Function(_$_CacheFailure) then) =
      __$$_CacheFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$_CacheFailureCopyWithImpl<$Res>
    extends _$CacheFailureCopyWithImpl<$Res, _$_CacheFailure>
    implements _$$_CacheFailureCopyWith<$Res> {
  __$$_CacheFailureCopyWithImpl(
      _$_CacheFailure _value, $Res Function(_$_CacheFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$_CacheFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_CacheFailure extends _CacheFailure {
  const _$_CacheFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'CacheFailure(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CacheFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CacheFailureCopyWith<_$_CacheFailure> get copyWith =>
      __$$_CacheFailureCopyWithImpl<_$_CacheFailure>(this, _$identity);
}

abstract class _CacheFailure extends CacheFailure {
  const factory _CacheFailure(
      {required final FailureMessages m, final Exception? e}) = _$_CacheFailure;
  const _CacheFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$_CacheFailureCopyWith<_$_CacheFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GenericFailure {
  FailureMessages get m => throw _privateConstructorUsedError;
  Exception? get e => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericFailureCopyWith<GenericFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericFailureCopyWith<$Res> {
  factory $GenericFailureCopyWith(
          GenericFailure value, $Res Function(GenericFailure) then) =
      _$GenericFailureCopyWithImpl<$Res, GenericFailure>;
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class _$GenericFailureCopyWithImpl<$Res, $Val extends GenericFailure>
    implements $GenericFailureCopyWith<$Res> {
  _$GenericFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_value.copyWith(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericFailureCopyWith<$Res>
    implements $GenericFailureCopyWith<$Res> {
  factory _$$_GenericFailureCopyWith(
          _$_GenericFailure value, $Res Function(_$_GenericFailure) then) =
      __$$_GenericFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FailureMessages m, Exception? e});
}

/// @nodoc
class __$$_GenericFailureCopyWithImpl<$Res>
    extends _$GenericFailureCopyWithImpl<$Res, _$_GenericFailure>
    implements _$$_GenericFailureCopyWith<$Res> {
  __$$_GenericFailureCopyWithImpl(
      _$_GenericFailure _value, $Res Function(_$_GenericFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? m = null,
    Object? e = freezed,
  }) {
    return _then(_$_GenericFailure(
      m: null == m
          ? _value.m
          : m // ignore: cast_nullable_to_non_nullable
              as FailureMessages,
      e: freezed == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_GenericFailure extends _GenericFailure {
  const _$_GenericFailure({required this.m, this.e}) : super._();

  @override
  final FailureMessages m;
  @override
  final Exception? e;

  @override
  String toString() {
    return 'GenericFailure(m: $m, e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericFailure &&
            (identical(other.m, m) || other.m == m) &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, m, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericFailureCopyWith<_$_GenericFailure> get copyWith =>
      __$$_GenericFailureCopyWithImpl<_$_GenericFailure>(this, _$identity);
}

abstract class _GenericFailure extends GenericFailure {
  const factory _GenericFailure(
      {required final FailureMessages m,
      final Exception? e}) = _$_GenericFailure;
  const _GenericFailure._() : super._();

  @override
  FailureMessages get m;
  @override
  Exception? get e;
  @override
  @JsonKey(ignore: true)
  _$$_GenericFailureCopyWith<_$_GenericFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
