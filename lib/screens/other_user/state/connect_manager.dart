import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/enums.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/connect_repo.dart';

@injectable
class ConnectStateManager with ChangeNotifier {
  final ConnectRepo _connectRepo = getIt<ConnectRepo>();

  ConnectStateManager(this._connectStatus);

  bool _isLoading = false;
  UserPairStatusEnum _connectStatus;

  bool get isLoading => _isLoading;
  UserPairStatusEnum get connectStatus => _connectStatus;

  Future<void> pair(String userId) async {
    _isLoading = true;
    final result = await _connectRepo.pair(userId);
    //TODO: only assign if there is no error during request
    _connectStatus = result;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> unpairOrRemoveRequest(String userId) async {
    _isLoading = true;
    await _connectRepo.unpairOrRemoveRequest(userId);
    //TODO: only assign if there is no error during request
    _connectStatus = UserPairStatusEnum.unpaired;
    _isLoading = false;
    notifyListeners();
  }
}
