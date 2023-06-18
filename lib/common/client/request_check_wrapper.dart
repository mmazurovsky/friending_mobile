import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../bag/strings.dart';
import '../data/failures/failures.dart';

abstract class RequestCheckWrapper {
  Future<RAWRESPONSE> call<RAWRESPONSE>(
    Future<RAWRESPONSE> requestFuture,
  );
}

@LazySingleton(as: RequestCheckWrapper)
class RequestCheckWrapperImpl implements RequestCheckWrapper {
  FailureMessages get _authFailureMessages => Strings.failures.authFaliure;
  FailureMessages get _serverFailureMessages => Strings.failures.serverFaliure;
  FailureMessages get _clientFailureMessages => Strings.failures.clientFailure;
  FailureMessages get _undefinedFailureMessages =>
      Strings.failures.undefinedFailure;

  @override
  Future<RAWRESPONSE> call<RAWRESPONSE>(
    Future<RAWRESPONSE> requestFuture,
  ) async {
    late final RAWRESPONSE response;
    RequestFailure? failure;

    try {
      response = await requestFuture;
    } on FirebaseException catch (e) {
      failure = RequestFailure.server(
        m: _serverFailureMessages,
        e: e,
      );
    } on DioError catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        if (statusCode >= 400 && statusCode <= 499) {
          if (statusCode == 401 || statusCode == 403) {
            failure = RequestFailure.auth(
              m: _authFailureMessages,
              e: e,
            );
          } else {
            failure = RequestFailure.client(
              m: _clientFailureMessages,
              e: e,
            );
          }
        } else if (statusCode >= 500 && statusCode <= 599) {
          failure = RequestFailure.server(
            m: _serverFailureMessages,
            e: e,
          );
        } else {
          failure = RequestFailure.undefined(
            m: _undefinedFailureMessages,
            e: e,
          );
        }
      } else {
        failure = RequestFailure.undefined(
          m: _undefinedFailureMessages,
          e: e,
        );
      }
    }

    if (failure != null) {
      throw failure;
    } else {
      return response;
    }
  }
}
