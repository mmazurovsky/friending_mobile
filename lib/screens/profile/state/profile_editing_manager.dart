import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/auth_and_profile/auth_repo.dart';
import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../repo/profile_repo.dart';
import 'profile_images_manager.dart';
import 'profile_texts_manager.dart';

@injectable
class ProfileEditingManager with ChangeNotifier {
  final ProfileImagesManager _imagesManager;
  final ProfileTextsAndTagsManager _textsManager;
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;

  bool _isDisposed = false;

  ProfileImagesManager get imagesManager => _imagesManager;
  ProfileTextsAndTagsManager get textsManager => _textsManager;

  Failure? _failure;
  Failure? get failure => _failure;

  final _isOperationSuccessfulStreamController = StreamController<bool>.broadcast();

  Stream<bool> get isOperationSuccessfulStream => _isOperationSuccessfulStreamController.stream;

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

  @override
  void dispose() {
    _isDisposed = true;
    _isOperationSuccessfulStreamController.close();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }

  void _fetchProfileAndInitManagers() async {
    final profileRaw = await _profileRepo.fetchProfileFromRemoteAndSaveLocally();
    FullReadUserModel? profile;
    //TODO try catch
    profile = profileRaw;

    // profileRaw.fold((l) {
    //   _failure = l;
    //   notifyListeners();
    //   _failure = null;
    // }, (r) {
    //   profile = r;
    // });

    if (profile == null) {
      _isItProfileCreation = true;
    }

    _imagesManager.createManagersBasedOnPhotos(profile?.shortUserModel.photos ?? []);
    _textsManager.fillFieldsBasedOnProfile(profile);
  }

  void updateProfile() async {
    final imageUrls = _imagesManager.managers.map((e) => e.photo.url).whereNotNull();

    final username = _textsManager.usernameController.text;
    final birthDate = _textsManager.birthDate!;
    final description = _textsManager.descriptionController.text;
    final lookingFor = _textsManager.lookingForController.text;

    final instagramUsername = _textsManager.instagramUsernameController.text;
    final instagramIsPrivate = _textsManager.instagramSecureStatus;
    final telegramUsername = _textsManager.telegramUsernameController.text;
    final telegramIsPrivate = _textsManager.telegramSecureStatus;
    final whatsappNumber = _textsManager.whatsappPhoneController.text;
    final whatsappIsPrivate = _textsManager.whatsappSecureStatus;

    final newTagsList = _textsManager.tagsToDisplay;
    final tagsToAddOnServer = _textsManager.tagsToAddOnServer;
    final tagsToRemoveOnServer = _textsManager.tagsToRemoveOnServer;

    //TODO try catch
    String? userId;
    userId = _authRepo.currentUser?.uid;

    if (userId != null) {
      final shortModel = ShortUpdateUserModel(
        username: username,
        birthDate: birthDate,
        photos: imageUrls.toList(),
        tags: newTagsList.map((e) => e.title).toList(),
        about: description,
        lookingFor: lookingFor,
      );

      final listOfSocialFields = <SecureUserInfoFieldModel>[];

      if (instagramUsername.isNotEmpty) {
        listOfSocialFields.add(
          SecureUserInfoFieldModel(
            title: 'Instagram',
            value: instagramUsername,
            order: 0,
            state: instagramIsPrivate,
          ),
        );
      }
      if (telegramUsername.isNotEmpty) {
        listOfSocialFields.add(
          SecureUserInfoFieldModel(
            title: 'Telegram',
            value: telegramUsername,
            order: 1,
            state: telegramIsPrivate,
          ),
        );
      }
      if (whatsappNumber.isNotEmpty) {
        listOfSocialFields.add(
          SecureUserInfoFieldModel(
            title: 'WhatsApp',
            value: whatsappNumber,
            order: 2,
            state: whatsappIsPrivate,
          ),
        );
      }

      final privateModel = SecureUserInfoModel(listOfSocialFields);

      late final void response;

      if (_isItProfileCreation) {
        //TODO try catch
        response = await _profileRepo.saveProfile(
          shortModel: shortModel.toCreateShortModel(userId),
          privateModel: privateModel,
        );
      } else {
        //TODO try catch and set _isOperationSuccessful 
        response = await _profileRepo.updateProfile(
          shortModel: shortModel,
          privateModel: privateModel,
          tagsToAdd: tagsToAddOnServer.toList(),
          tagsToRemove: tagsToRemoveOnServer.toList(),
        );

        _isOperationSuccessfulStreamController.add(true);
      }

      notifyListeners();

      // response.fold((l) {
      //   _failure = l;
      //   notifyListeners();
      //   _failure = null;
      // }, (r) {
      //   _isOperationSuccessful = true;
      //   notifyListeners();
      //   _isOperationSuccessful = null;
      // });
    }
  }
}
