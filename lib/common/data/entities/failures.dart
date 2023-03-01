import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

abstract class Failure {
  String get userMessage;
  String get systemMessage;
  Exception? get exception;
  String get wholeSystemMessage;
}

@freezed
class ApiFailure with _$ApiFailure implements Failure {
  const ApiFailure._();

  factory ApiFailure.serverError({
    required String userMessage,
    required String systemMessage,
    Exception? exception,
  }) = ServerFailure;

  factory ApiFailure.undefinedError({
    required String userMessage,
    required String systemMessage,
    Exception? exception,
  }) = UndefinedFailure;

  factory ApiFailure.clientError({
    required String userMessage,
    required String systemMessage,
    Exception? exception,
  }) = ClientFailure;

  @override
  String get wholeSystemMessage {
    return '$systemMessage / ${exception.toString()}';
  }
}

@freezed
abstract class CacheFailure with _$CacheFailure implements Failure {
  const CacheFailure._();
  const factory CacheFailure({
    Exception? exception,
  }) = _CacheFailure;

  @override
  String get userMessage => 'There is an error in the app';

  @override
  String get systemMessage => 'Cache error';

  @override
  String get wholeSystemMessage {
    return '$systemMessage / ${exception.toString()}';
  }
}

@freezed
abstract class AuthFailure with _$AuthFailure implements Failure {
  const AuthFailure._();
  const factory AuthFailure({
    Exception? exception,
    required String systemMessage,
  }) = _AuthFailure;

  @override
  String get userMessage => 'Authentication error';

  @override
  String get wholeSystemMessage {
    return '$systemMessage / ${exception.toString()}';
  }
}

const clientFailureMessageToDisplay = 'There is an error in the app';
const serverFailureMessageToDisplay = 'Server error';
const undefinedFailureMessageToDisplay = 'Undefined error';
const noInternetFailureMessageToDisplay = 'No internet';

const clientFailureSystemMessage = 'Client error';
const serverFailureSystemMessage = 'Server error';
const undefinedFailureSystemMessage = 'Undefined error';
const noInternetFailureSystemMessage = 'User does not have internet';
