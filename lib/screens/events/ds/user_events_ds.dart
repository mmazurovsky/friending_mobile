import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/strings.dart';
import '../../../common/client/request_check_wrapper.dart';
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
  String get eventsCollection => Strings.server.userEventsCollection;

  Future<Stream<UserEventModel>> getEvents() async {
    final currentUserRaw = _authRepo.currentUser!;

    final rawStream = _firebaseFirestore
        .collection(eventsCollection)
        .where('ownerUserId', isEqualTo: currentUserRaw.uid)
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

    return streamController.stream;
  }
}
