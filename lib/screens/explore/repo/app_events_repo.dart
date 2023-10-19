import '../../../common/auth_and_profile/auth_repo.dart';
import '../ds/app_events_remote_ds.dart';

abstract class AppEventsRepo {
  Future<void> addAppOpenedEvent();
}

class AppEventsRepoImpl implements AppEventsRepo {
  final AppEventsRemoteDS _appEventsRemoteDS;
  final AuthRepo _authRepo;

  AppEventsRepoImpl(
    this._appEventsRemoteDS,
    this._authRepo,
  );

  @override
  Future<void> addAppOpenedEvent() async {
    final currentUser = _authRepo.currentUser;
    if (currentUser != null) {
      return _appEventsRemoteDS.addAppOpenedEvent(currentUser);
    }
  }
}
