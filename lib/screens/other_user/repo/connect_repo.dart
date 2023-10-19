import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/auth_repo.dart';
import '../../profile/repo/profile_repo.dart';
import '../ds/connect_ds.dart';

abstract class ConnectRepo {
  Future<ConnectRequestResponse> pair(String userId);
  Future<void> unpairOrRemoveRequest(String userId);
}

@LazySingleton(as: ConnectRepo)
class ConnectRepoImpl implements ConnectRepo {
  final ConnectDS _connectDS;
  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;

  ConnectRepoImpl(
    this._connectDS,
    this._profileRepo,
    this._authRepo,
  );

  @override
  Future<ConnectRequestResponse> pair(String userId) async {
    final currentUser = _authRepo.currentUser;
    if (currentUser == null) {
      return ConnectRequestNotAuthenticated();
    } else {
      final currentPoints = _profileRepo.currentPointsCount;
      if (currentPoints < 1) {
        return ConnectRequestNotEnoughPoints();
      } else {
        final pairResponse = await _connectDS.pair(userId);
        return pairResponse;
      }
    }
  }

  @override
  Future<void> unpairOrRemoveRequest(String userId) {
    return _connectDS.unpairOrRemoveRequest(userId);
  }
}

sealed class ConnectRequestResponse {}

class ConnectRequestSend extends ConnectRequestResponse {}

class ConnectRequestPaired extends ConnectRequestResponse {}

class ConnectRequestNotEnoughPoints extends ConnectRequestResponse {}

class ConnectRequestNotAuthenticated extends ConnectRequestResponse {}
