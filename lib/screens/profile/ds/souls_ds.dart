import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/bag.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class SoulsDS {
  Future<Either<RequestFailure, void>> incrementCurrentUserSouls();
}

@LazySingleton(as: SoulsDS)
class SoulsDSImpl implements SoulsDS, LoggerNameGetter {
  final RequestCheckWrapper _requestCheckWrapper;
  final FirebaseFirestore _firestore;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  SoulsDSImpl(this._requestCheckWrapper, this._firestore, this._authRepo,
      this._customLogger);

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';

  String get userCollection => Bag.strings.server.shortUsersCollection;

  @override
  Future<Either<RequestFailure, void>> incrementCurrentUserSouls() async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold((l) async {
      return left<RequestFailure, void>(l);
    }, (r) async {
      final currentUserId = r.uid;

      final future = _firestore
          .collection(userCollection)
          .doc(currentUserId)
          .update({'soulsCount': FieldValue.increment(1)});

      return await _requestCheckWrapper(future);
    });

    return result;
  }
}
