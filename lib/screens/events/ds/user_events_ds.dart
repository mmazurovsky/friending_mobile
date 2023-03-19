import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/bag.dart';
import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/event_models.dart';
import '../../../common/utils/logger/custom_logger.dart';
import '../../../common/utils/logger/logger_name_provider.dart';

abstract class UserEventsDS {}

class UserEventsDSImpl implements UserEventsDS, LoggerNameGetter {
  final FirebaseFirestore _firebaseFirestore;
  final RequestCheckWrapper _requestCheckWrapper;
  final AuthRepo _authRepo;
  final CustomLogger _customLogger;

  UserEventsDSImpl(
    this._firebaseFirestore,
    this._requestCheckWrapper,
    this._authRepo,
    this._customLogger,
  );

  @override
  String get loggerName => '$runtimeType #${identityHashCode(this)}';
  String get eventsCollection => Bag.strings.server.userEventsCollection;

  Future<Either<RequestFailure, Stream<UserEventModel>>> getEvents() async {
    final currentUserRaw = _authRepo.currentUser;

    final result = await currentUserRaw.fold(
      (l) async {
        return left<RequestFailure, Stream<UserEventModel>>(l);
      },
      (r) async {
        final rawStream = _firebaseFirestore
            .collection(eventsCollection)
            .where('ownerUserId', isEqualTo: r.uid)
            .orderBy('dateTime')
            .withConverter(
                fromFirestore: (snapshot, _) =>
                    UserEventModel.fromJson(snapshot.data()!),
                toFirestore: (UserEventModel model, _) => model.toJson())
            .snapshots();

        final streamController = StreamController<UserEventModel>();

        rawStream.map(
          (event) {
            final list = event.docs
                .map(
                  (e) => e.data(),
                )
                .toList();
            for (final element in list) {
              streamController.add(element);
            }
          },
        );

        return right<RequestFailure, Stream<UserEventModel>>(
            streamController.stream);
      },
    );

    result.fold(
      (l) => _customLogger.logFailure(
        loggerName: loggerName,
        failure: l,
      ),
      (r) => null,
    );

    return result;
  }
}
