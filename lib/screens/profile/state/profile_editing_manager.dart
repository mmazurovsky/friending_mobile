import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../repo/profile_repo.dart';
import 'profile_images_manager.dart';
import 'profile_texts_manager.dart';

class ProfileEditingManager with ChangeNotifier {
  final ProfileImagesManager _imagesManager;
  final ProfileTextsManager _textsManager;
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;

  Failure? _failure;
  Failure? get failure => _failure;

  bool? _isOperationSuccessful;
  bool? get isOperationSuccessful => _isOperationSuccessful;

  ProfileEditingManager(
    this._imagesManager,
    this._textsManager,
    this._profileRepo,
    this._authRepo,
  );

  void updateProfile() async {
    final imageUrls =
        _imagesManager.managers.map((e) => e.photo.url).whereNotNull();

    final username = _textsManager.usernameController.text;
    final birthDate = _textsManager.birthDate!;
    final description = _textsManager.descriptionController.text;
    final lookingFor = _textsManager.lookingForController.text;

    final instagramUsername = _textsManager.instagramUsernameController.text;
    final telegramUsername = _textsManager.telegramUsernameController.text;

    final newTagsList = _textsManager.tagsToDisplay;
    final tagsToAddOnServer = _textsManager.tagsToAddOnServer;
    final tagsToRemoveOnServer = _textsManager.tagsToRemoveOnServer;

    final userId = _authRepo.currentUser.fold((l) {
      // TODO!: do something
    }, (r) => r.uid);

    if (userId != null) {
      final shortModel = ShortUpdateUserModel(
        username: username,
        birthDate: birthDate,
        photos: imageUrls.toList(),
        tags: newTagsList.toList(),
      );

      final additionalModel = AdditionalUserModel(
        description: description,
        lookingFor: lookingFor,
      );

      final privateModel = PrivateInfoUserModel(
        instagramUsername: instagramUsername,
        telegramUsername: telegramUsername,
      );

      final response = await _profileRepo.updateProfile(
        shortModel: shortModel,
        additionalModel: additionalModel,
        privateModel: privateModel,
        tagsToAdd: tagsToAddOnServer.toList(),
        tagsToRemove: tagsToRemoveOnServer.toList(),
      );

      response.fold((l) {
        _failure = l;
        notifyListeners();
        _failure = null;
      }, (r) {
        _isOperationSuccessful = true;
        notifyListeners();
        _isOperationSuccessful = null;
      });
    }
  }
}
