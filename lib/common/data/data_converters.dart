import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_starter_mobile/common/data/user.dart';

import 'data_interfaces.dart';

class DataConverter {
  static MyUser convertFromFirebaseUser(User firebaseUser) {
    return MyUser.fromFirebaseUser(firebaseUser);
  }
}
