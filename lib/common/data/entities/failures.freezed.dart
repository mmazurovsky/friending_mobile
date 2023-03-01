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
mixin _$ApiFailure {
  String get userMessage => throw _privateConstructorUsedError;
  String get systemMessage => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        serverError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        undefinedError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        clientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(UndefinedFailure value) undefinedError,
    required TResult Function(ClientFailure value) clientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(UndefinedFailure value)? undefinedError,
    TResult? Function(ClientFailure value)? clientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(UndefinedFailure value)? undefinedError,
    TResult Function(ClientFailure value)? clientError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiFailureCopyWith<ApiFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiFailureCopyWith<$Res> {
  factory $ApiFailureCopyWith(
          ApiFailure value, $Res Function(ApiFailure) then) =
      _$ApiFailureCopyWithImpl<$Res, ApiFailure>;
  @useResult
  $Res call({String userMessage, String systemMessage, Exception? exception});
}

/// @nodoc
class _$ApiFailureCopyWithImpl<$Res, $Val extends ApiFailure>
    implements $ApiFailureCopyWith<$Res> {
  _$ApiFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userMessage = null,
    Object? systemMessage = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerFailureCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure value, $Res Function(_$ServerFailure) then) =
      __$$ServerFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userMessage, String systemMessage, Exception? exception});
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ServerFailure>
    implements _$$ServerFailureCopyWith<$Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure _value, $Res Function(_$ServerFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userMessage = null,
    Object? systemMessage = null,
    Object? exception = freezed,
  }) {
    return _then(_$ServerFailure(
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ServerFailure extends ServerFailure {
  _$ServerFailure(
      {required this.userMessage, required this.systemMessage, this.exception})
      : super._();

  @override
  final String userMessage;
  @override
  final String systemMessage;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'ApiFailure.serverError(userMessage: $userMessage, systemMessage: $systemMessage, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailure &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage) &&
            (identical(other.systemMessage, systemMessage) ||
                other.systemMessage == systemMessage) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userMessage, systemMessage, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      __$$ServerFailureCopyWithImpl<_$ServerFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        serverError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        undefinedError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        clientError,
  }) {
    return serverError(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
  }) {
    return serverError?.call(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(userMessage, systemMessage, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(UndefinedFailure value) undefinedError,
    required TResult Function(ClientFailure value) clientError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(UndefinedFailure value)? undefinedError,
    TResult? Function(ClientFailure value)? clientError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(UndefinedFailure value)? undefinedError,
    TResult Function(ClientFailure value)? clientError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends ApiFailure {
  factory ServerFailure(
      {required final String userMessage,
      required final String systemMessage,
      final Exception? exception}) = _$ServerFailure;
  ServerFailure._() : super._();

  @override
  String get userMessage;
  @override
  String get systemMessage;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureCopyWith<_$ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndefinedFailureCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$UndefinedFailureCopyWith(
          _$UndefinedFailure value, $Res Function(_$UndefinedFailure) then) =
      __$$UndefinedFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userMessage, String systemMessage, Exception? exception});
}

/// @nodoc
class __$$UndefinedFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$UndefinedFailure>
    implements _$$UndefinedFailureCopyWith<$Res> {
  __$$UndefinedFailureCopyWithImpl(
      _$UndefinedFailure _value, $Res Function(_$UndefinedFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userMessage = null,
    Object? systemMessage = null,
    Object? exception = freezed,
  }) {
    return _then(_$UndefinedFailure(
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$UndefinedFailure extends UndefinedFailure {
  _$UndefinedFailure(
      {required this.userMessage, required this.systemMessage, this.exception})
      : super._();

  @override
  final String userMessage;
  @override
  final String systemMessage;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'ApiFailure.undefinedError(userMessage: $userMessage, systemMessage: $systemMessage, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndefinedFailure &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage) &&
            (identical(other.systemMessage, systemMessage) ||
                other.systemMessage == systemMessage) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userMessage, systemMessage, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UndefinedFailureCopyWith<_$UndefinedFailure> get copyWith =>
      __$$UndefinedFailureCopyWithImpl<_$UndefinedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        serverError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        undefinedError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        clientError,
  }) {
    return undefinedError(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
  }) {
    return undefinedError?.call(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(userMessage, systemMessage, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(UndefinedFailure value) undefinedError,
    required TResult Function(ClientFailure value) clientError,
  }) {
    return undefinedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(UndefinedFailure value)? undefinedError,
    TResult? Function(ClientFailure value)? clientError,
  }) {
    return undefinedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(UndefinedFailure value)? undefinedError,
    TResult Function(ClientFailure value)? clientError,
    required TResult orElse(),
  }) {
    if (undefinedError != null) {
      return undefinedError(this);
    }
    return orElse();
  }
}

abstract class UndefinedFailure extends ApiFailure {
  factory UndefinedFailure(
      {required final String userMessage,
      required final String systemMessage,
      final Exception? exception}) = _$UndefinedFailure;
  UndefinedFailure._() : super._();

  @override
  String get userMessage;
  @override
  String get systemMessage;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$UndefinedFailureCopyWith<_$UndefinedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientFailureCopyWith<$Res>
    implements $ApiFailureCopyWith<$Res> {
  factory _$$ClientFailureCopyWith(
          _$ClientFailure value, $Res Function(_$ClientFailure) then) =
      __$$ClientFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userMessage, String systemMessage, Exception? exception});
}

/// @nodoc
class __$$ClientFailureCopyWithImpl<$Res>
    extends _$ApiFailureCopyWithImpl<$Res, _$ClientFailure>
    implements _$$ClientFailureCopyWith<$Res> {
  __$$ClientFailureCopyWithImpl(
      _$ClientFailure _value, $Res Function(_$ClientFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userMessage = null,
    Object? systemMessage = null,
    Object? exception = freezed,
  }) {
    return _then(_$ClientFailure(
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as String,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ClientFailure extends ClientFailure {
  _$ClientFailure(
      {required this.userMessage, required this.systemMessage, this.exception})
      : super._();

  @override
  final String userMessage;
  @override
  final String systemMessage;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'ApiFailure.clientError(userMessage: $userMessage, systemMessage: $systemMessage, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientFailure &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage) &&
            (identical(other.systemMessage, systemMessage) ||
                other.systemMessage == systemMessage) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userMessage, systemMessage, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientFailureCopyWith<_$ClientFailure> get copyWith =>
      __$$ClientFailureCopyWithImpl<_$ClientFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        serverError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        undefinedError,
    required TResult Function(
            String userMessage, String systemMessage, Exception? exception)
        clientError,
  }) {
    return clientError(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult? Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
  }) {
    return clientError?.call(userMessage, systemMessage, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        serverError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        undefinedError,
    TResult Function(
            String userMessage, String systemMessage, Exception? exception)?
        clientError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(userMessage, systemMessage, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) serverError,
    required TResult Function(UndefinedFailure value) undefinedError,
    required TResult Function(ClientFailure value) clientError,
  }) {
    return clientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? serverError,
    TResult? Function(UndefinedFailure value)? undefinedError,
    TResult? Function(ClientFailure value)? clientError,
  }) {
    return clientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? serverError,
    TResult Function(UndefinedFailure value)? undefinedError,
    TResult Function(ClientFailure value)? clientError,
    required TResult orElse(),
  }) {
    if (clientError != null) {
      return clientError(this);
    }
    return orElse();
  }
}

abstract class ClientFailure extends ApiFailure {
  factory ClientFailure(
      {required final String userMessage,
      required final String systemMessage,
      final Exception? exception}) = _$ClientFailure;
  ClientFailure._() : super._();

  @override
  String get userMessage;
  @override
  String get systemMessage;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$ClientFailureCopyWith<_$ClientFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CacheFailure {
  Exception? get exception => throw _privateConstructorUsedError;

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
  $Res call({Exception? exception});
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
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
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
  $Res call({Exception? exception});
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
    Object? exception = freezed,
  }) {
    return _then(_$_CacheFailure(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$_CacheFailure extends _CacheFailure {
  const _$_CacheFailure({this.exception}) : super._();

  @override
  final Exception? exception;

  @override
  String toString() {
    return 'CacheFailure(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CacheFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CacheFailureCopyWith<_$_CacheFailure> get copyWith =>
      __$$_CacheFailureCopyWithImpl<_$_CacheFailure>(this, _$identity);
}

abstract class _CacheFailure extends CacheFailure {
  const factory _CacheFailure({final Exception? exception}) = _$_CacheFailure;
  const _CacheFailure._() : super._();

  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CacheFailureCopyWith<_$_CacheFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthFailure {
  Exception? get exception => throw _privateConstructorUsedError;
  String get systemMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
  @useResult
  $Res call({Exception? exception, String systemMessage});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? systemMessage = null,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthFailureCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$_AuthFailureCopyWith(
          _$_AuthFailure value, $Res Function(_$_AuthFailure) then) =
      __$$_AuthFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Exception? exception, String systemMessage});
}

/// @nodoc
class __$$_AuthFailureCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$_AuthFailure>
    implements _$$_AuthFailureCopyWith<$Res> {
  __$$_AuthFailureCopyWithImpl(
      _$_AuthFailure _value, $Res Function(_$_AuthFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? systemMessage = null,
  }) {
    return _then(_$_AuthFailure(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
      systemMessage: null == systemMessage
          ? _value.systemMessage
          : systemMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthFailure extends _AuthFailure {
  const _$_AuthFailure({this.exception, required this.systemMessage})
      : super._();

  @override
  final Exception? exception;
  @override
  final String systemMessage;

  @override
  String toString() {
    return 'AuthFailure(exception: $exception, systemMessage: $systemMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.systemMessage, systemMessage) ||
                other.systemMessage == systemMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception, systemMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthFailureCopyWith<_$_AuthFailure> get copyWith =>
      __$$_AuthFailureCopyWithImpl<_$_AuthFailure>(this, _$identity);
}

abstract class _AuthFailure extends AuthFailure {
  const factory _AuthFailure(
      {final Exception? exception,
      required final String systemMessage}) = _$_AuthFailure;
  const _AuthFailure._() : super._();

  @override
  Exception? get exception;
  @override
  String get systemMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthFailureCopyWith<_$_AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
