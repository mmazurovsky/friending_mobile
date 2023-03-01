import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../data/entities/failures.dart';
import '../utils/logger/custom_logger.dart';
import '../utils/logger/logger_name_provider.dart';

abstract class RequestCheckWrapper {
  Future<Either<ApiFailure, RESPONSE>> requestToRemoteServer<RESPONSE>(
    Future<RESPONSE> requestFuture,
  );
}

@LazySingleton(as: RequestCheckWrapper)
class RequestCheckWrapperImpl with LoggerNameProvider implements RequestCheckWrapper {
  final CustomLogger _customLogger;

  RequestCheckWrapperImpl(
    this._customLogger,
  );

  @override
  Future<Either<ApiFailure, RESPONSE>> requestToRemoteServer<RESPONSE>(
    Future<RESPONSE> requestFuture,
  ) async {
    late final RESPONSE response;
    ApiFailure? failure;

    try {
      response = await requestFuture;
    } on FirebaseException catch (e) {
      failure = ApiFailure.serverError(
        userMessage: serverFailureMessageToDisplay,
        systemMessage: serverFailureSystemMessage,
        exception: e,
      );
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        if (statusCode >= 400 && statusCode <= 499) {
          failure = ApiFailure.clientError(
            userMessage: clientFailureMessageToDisplay,
            systemMessage: clientFailureSystemMessage,
            exception: e,
          );
        } else if (statusCode >= 500 && statusCode <= 599) {
          failure = ApiFailure.serverError(
            userMessage: serverFailureMessageToDisplay,
            systemMessage: serverFailureSystemMessage,
            exception: e,
          );
        } else {
          failure = ApiFailure.undefinedError(
            userMessage: undefinedFailureMessageToDisplay,
            systemMessage:
                'Status code of response from server is ok, but there is still DioError',
            exception: e,
          );
        }
      } else {
        failure = ApiFailure.undefinedError(
          userMessage: undefinedFailureMessageToDisplay,
          systemMessage: undefinedFailureSystemMessage,
          exception: e,
        );
      }
    }

    if (failure != null) {
      _customLogger.logFailure(
        loggerName: loggerName,
        failure: failure,
      );
      return Left(failure);
    } else {
      return Right(response);
    }
  }
}
