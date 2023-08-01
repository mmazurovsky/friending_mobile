import 'package:flutter_mobile_starter/common/data/enums.dart';
import 'package:injectable/injectable.dart';

import '../ds/connect_ds.dart';

abstract class ConnectRepo {
  Future<UserPairStatusEnum> pair(String userId);
  Future<void> unpairOrRemoveRequest(String userId);
}

@LazySingleton(as: ConnectRepo)
class ConnectRepoImpl implements ConnectRepo {
  final ConnectDS _connectDS;

  ConnectRepoImpl(this._connectDS);

  @override
  Future<UserPairStatusEnum> pair(String userId) {
    return _connectDS.pair(userId);
  }

  @override
  Future<void> unpairOrRemoveRequest(String userId) {
    return _connectDS.unpairOrRemoveRequest(userId);
  }
}
