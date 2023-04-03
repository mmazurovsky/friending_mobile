import 'package:flutter/material.dart';

class UserListNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<User> _nearbyUsers = [];
  List<User> get nearbyUsers => _nearbyUsers;

  List<User> _usersWithCommonInterests = [];
  List<User> get usersWithCommonInterests => _usersWithCommonInterests;

  void fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    // make a request to the server to get the two lists of users separately
    // replace this with your actual implementation of making a request to the server

    _nearbyUsers = []; // replace with actual list of nearby users
    _usersWithCommonInterests = []; // replace with actual list of users with common interests

    _isLoading = false;
    notifyListeners();
  }
}

class User {
  final String nickname;
  final int age;
  final List<String> interests;

  User({
    required this.nickname,
    required this.age,
    required this.interests,
  });
}
