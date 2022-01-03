import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_interfaces.dart';

part 'user.freezed.dart';
// part 'user.g.dart';

@freezed
class MyUser with _$MyUser implements UserInterface {
  const MyUser._();
  const factory MyUser({
    required String id,
    required String name,
    required Future<String?> idToken,
  }) = _User;

  // factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

  factory MyUser.fromFirebaseUser(User firebaseUser) {
    return MyUser(
      id: firebaseUser.uid,
      name: firebaseUser.displayName!,
      idToken: firebaseUser.getIdToken(),
    );
  }
}
