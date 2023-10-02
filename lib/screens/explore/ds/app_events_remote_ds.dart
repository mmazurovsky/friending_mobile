import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../common/client/request_check_wrapper.dart';
import '../../../common/data/models/event_models.dart';

abstract class AppEventsRemoteDS {
  Future<void> addAppOpenedEvent(User currentUser);
}

@LazySingleton(as: AppEventsRemoteDS)
class AppEventsRemoteDSImpl implements AppEventsRemoteDS {
  final FirebaseFirestore _firestore;
  final RequestCheckWrapper _requestCheckWrapper;

  AppEventsRemoteDSImpl(
    this._requestCheckWrapper,
    this._firestore,
  );

  String get appEventsCollection => 'appOpenedEvents';

  @override
  Future<void> addAppOpenedEvent(User currentUser) async {
    final data = AppOpenedEventModel(
      dateTime: DateTime.now(),
      userId: currentUser.uid,
    );
    final future = _firestore.collection(appEventsCollection).add(data.toJson());
    final response = _requestCheckWrapper.call(future);
  }
}
