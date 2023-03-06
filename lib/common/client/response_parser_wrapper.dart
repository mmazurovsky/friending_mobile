import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../data/entities/failures.dart';
import 'response_descriptor.dart';

abstract class ResponseParserWrapper {
  Future<Either<RequestFailure, CUSTOMMODEL?>> parseMap<CUSTOMMODEL>(
      Either<RequestFailure, Map<String, dynamic>?> rawResponse);
  Future<Either<RequestFailure, List<CUSTOMMODEL?>>>
      parseListOfMaps<CUSTOMMODEL>(
          Either<RequestFailure, List<Map<String, dynamic>?>> rawResponse);
  Future<Either<RequestFailure, List<CUSTOMMODEL>>> parseQuerySnapshotMap<
          CUSTOMMODEL>(
      Either<RequestFailure, QuerySnapshot<Map<String, dynamic>>> rawResponse);
}

@LazySingleton(as: ResponseParserWrapper)
class ResponseParserWrapperImpl implements ResponseParserWrapper {
  @override
  Future<Either<RequestFailure, CUSTOMMODEL?>> parseMap<CUSTOMMODEL>(
      Either<RequestFailure, Map<String, dynamic>?> rawResponse) async {
    final response = rawResponse.map(
        (r) => r == null ? null : ResponseDescriptor.parseMap<CUSTOMMODEL>(r));
    return response;
  }

  @override
  Future<Either<RequestFailure, List<CUSTOMMODEL>>>
      parseQuerySnapshotMap<CUSTOMMODEL>(
          Either<RequestFailure, QuerySnapshot<Map<String, dynamic>>>
              rawResponse) async {
    final response = rawResponse.map(
      (r) => r.docs.map(
        (e) {
          final data = e.data();
          return ResponseDescriptor.parseMap<CUSTOMMODEL>(data);
        },
      ).toList(),
    );
    return response;
  }

  @override
  Future<Either<RequestFailure, List<CUSTOMMODEL?>>> parseListOfMaps<
          CUSTOMMODEL>(
      Either<RequestFailure, List<Map<String, dynamic>?>> rawResponse) async {
    final response = rawResponse.map(
      (r) => r
          .map((e) =>
              e == null ? null : ResponseDescriptor.parseMap<CUSTOMMODEL>(e))
          .toList(),
    );
    return response;
  }
}
