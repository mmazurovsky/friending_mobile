import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter_mobile/common/data/user.dart';
import 'package:flutter_starter_mobile/common/navigation/my_navigation.dart';

import 'data_converters.dart';

extension NavigationExtentions on NavigationRoute {
  static const Map<NavigationRoute, String> _pathMap = {
    NavigationRoute.screen: '/screen',
  };

  String get path => _pathMap[this]!;
}

extension RoutingExtension on String {
  Uri get getUri {
    return Uri.parse(this);
  }
}

extension UserConvertion on User {
  MyUser convertToUserInterface() {
    return DataConverter.convertFromFirebaseUser(this);
  }
}
