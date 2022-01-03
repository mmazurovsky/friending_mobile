import 'package:flutter_starter_mobile/common/exceptions/custom_exceptions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnectedToNetwork;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnectedToNetwork =>
      _internetConnectionChecker.hasConnection;
}

class NetworkCheck {
  final NetworkInfo _networkInfo;
  NetworkCheck(this._networkInfo);

  void call() async {
    if (await _networkInfo.isConnectedToNetwork) {
    } else {
      throw CustomNoInternetException("No Internet");
    }
  }
}
