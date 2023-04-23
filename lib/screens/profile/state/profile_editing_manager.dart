import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/failures/failures.dart';
import '../../../common/utils/extensions.dart';
import '../repo/profile_repo.dart';

@injectable
class ProfileEditingManager with ChangeNotifier {
  final ProfileRepo _profileRepo;
  ProfileEditingManager(this._profileRepo);

  final _usernameController = TextEditingController();
  final _usernameFocusNode = FocusNode();

  TextEditingController get usernameController => _usernameController;
  FocusNode get usernameFocusNode => _usernameFocusNode;

  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  final _birthDateController = TextEditingController();
  TextEditingController get birthDateController => _birthDateController;

  final _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final _lookingForController = TextEditingController();
  TextEditingController get lookingForController => _lookingForController;

  final _instagramUsernameController = TextEditingController();
  TextEditingController get instagramUsernameController =>
      _instagramUsernameController;

  final _telegreamUsernameController = TextEditingController();
  TextEditingController get telegramUsernameController =>
      _telegreamUsernameController;

  final _addTagsController = TextEditingController();
  TextEditingController get addTagsController => _addTagsController;
  final _addTagsFocusNode = FocusNode();
  FocusNode get addTagsFocusNode => _addTagsFocusNode;

  final Set<String> _initialTags = {};
  final Set<String> _tagsToDisplay = {};
  Set<String> get tagsToDisplay => _tagsToDisplay;

  Failure? _failure;
  Failure? get failure => _failure;

  Future<bool> checkUsernameIsFree(String username) async {
    late bool isUsernameFree;
    try {
      isUsernameFree = await _profileRepo.isUsernameFree(username);
    } on Failure catch (e) {
      _failure = e;
      notifyListeners();
      _failure = null;
    }
    return isUsernameFree;
  }

  void changeBirthDate(DateTime newBirthDate) {
    if (_birthDate != newBirthDate) {
      _birthDate = newBirthDate;
      _birthDateController.text = _birthDate?.toDateString() ?? '';
      notifyListeners();
    }
  }

  void addTags() {
    final Set<String> inputTags = {};
    _addTagsController.text.split(',').forEach((rawTag) {
      final tag = rawTag.trim();
      if (tag.isNotEmpty) {
        inputTags.add(tag);
      }
    });
    if (inputTags.isNotEmpty) {
      _addTagsSet(inputTags);
    }
  }

  void _addTagsSet(Set<String> inputTags) {
    final tagsToAdd = inputTags.difference(_tagsToDisplay);
    if (tagsToAdd.isNotEmpty) {
      _tagsToDisplay.addAll(tagsToAdd);
      notifyListeners();
    }
  }

  void removeTag(String inputTag) {
    if (_tagsToDisplay.contains(inputTag)) {
      _tagsToDisplay.remove(inputTag);
      notifyListeners();
    }
  }
}
