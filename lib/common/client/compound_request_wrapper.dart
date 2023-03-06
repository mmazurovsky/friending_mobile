import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../data/entities/failures.dart';
import 'request_check_wrapper.dart';
import 'response_parser_wrapper.dart';

class CompoundRequestWrapper {
  final RequestCheckWrapper _requestCheckWrapper;
  final ResponseParserWrapper _responseParserWrapper;

  CompoundRequestWrapper(
    this._requestCheckWrapper,
    this._responseParserWrapper,
  );

  Future<Either<RequestFailure, CUSTOMMODEL?>> wrapMap<CUSTOMMODEL>(
    Future<Map<String, dynamic>> requestFutureRawResponse,
  ) async {
    final rawEither = await _requestCheckWrapper
        .requestToRemoteServer(requestFutureRawResponse);
    final parsedEither =
        await _responseParserWrapper.parseMap<CUSTOMMODEL>(rawEither);
    return parsedEither;
  }

  Future<Either<RequestFailure, List<CUSTOMMODEL?>>> wrapListMap<CUSTOMMODEL>(
    Future<List<Map<String, dynamic>>> requestFutureRawResponse,
  ) async {
    final rawEither = await _requestCheckWrapper
        .requestToRemoteServer(requestFutureRawResponse);
    final parsedEither =
        await _responseParserWrapper.parseListOfMaps<CUSTOMMODEL>(rawEither);
    return parsedEither;
  }

  Future<Either<RequestFailure, List<CUSTOMMODEL>>>
      wrapQuerySnapshotMap<CUSTOMMODEL>(
    Future<QuerySnapshot<Map<String, dynamic>>> requestFutureRawResponse,
  ) async {
    final rawEither = await _requestCheckWrapper
        .requestToRemoteServer(requestFutureRawResponse);
    final parsedEither = await _responseParserWrapper
        .parseQuerySnapshotMap<CUSTOMMODEL>(rawEither);
    return parsedEither;
  }
}
