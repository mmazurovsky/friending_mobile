import 'package:flutter/material.dart';

import 'profile_images_manager.dart';
import 'profile_texts_manager.dart';

class ProfileEditingManager with ChangeNotifier {
  final ProfileImagesManager _imagesManager;
  final ProfileTextsManager _textsManager;

  ProfileEditingManager(
    this._imagesManager,
    this._textsManager,
  );

  void updateProfile() {
    
  }
}
