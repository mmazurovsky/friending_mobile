import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../repo/profile_repo.dart';
import 'profile_images_manager.dart';
import 'profile_texts_manager.dart';

class ProfileEditingManager with ChangeNotifier {
  final ProfileImagesManager _imagesManager;
  final ProfileTextsAndTagsManager _textsManager;
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;

  Failure? _failure;
  Failure? get failure => _failure;

  bool? _isOperationSuccessful;
  bool? get isOperationSuccessful => _isOperationSuccessful;

  bool _isItProfileCreation = false;
  bool get isItProfileCreation => _isItProfileCreation;

  ProfileEditingManager(
    this._imagesManager,
    this._textsManager,
    this._profileRepo,
    this._authRepo,
  ) {
    _fetchProfileAndInitManagers();
  }

  void _fetchProfileAndInitManagers() async {
    final profileRaw =
        await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
    FullReadUserModel? profile;
    profileRaw.fold((l) {
      _failure = l;
      notifyListeners();
      _failure = null;
    }, (r) {
      profile = r;
    });

    if (profile == null) {
      _isItProfileCreation = true;
    }

    _imagesManager
        .createManagersBasedOnPhotos(profile?.shortUserModel.photos ?? []);
    _textsManager.fillFieldsBasedOnProfile(profile);
  }

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
        tags: newTagsList.map((e) => e.title).toList(),
      );

      final additionalModel = AdditionalUserModel(
        description: description,
        lookingFor: lookingFor,
      );

      final privateModel = PrivateInfoUserModel(
        instagramUsername: instagramUsername,
        telegramUsername: telegramUsername,
      );

      late final Either<RequestFailure, void> response;

      if (_isItProfileCreation) {
        response = await _profileRepo.saveProfile(
          shortModel: shortModel.toCreateShortModel(userId),
          additionalModel: additionalModel,
          privateModel: privateModel,
        );
      } else {
        response = await _profileRepo.updateProfile(
          shortModel: shortModel,
          additionalModel: additionalModel,
          privateModel: privateModel,
          tagsToAdd: tagsToAddOnServer.toList(),
          tagsToRemove: tagsToRemoveOnServer.toList(),
        );
      }

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
