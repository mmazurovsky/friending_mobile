import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SingleProfileImageManager with ChangeNotifier {
  // final int _orderOfManager;
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;
  final String _uuid;
  SingleProfileImageManager(
    // this._orderOfManager,
    this._uuid,
    this._photo,
    this._imagePicker,
    this._imageCropper,
  );

  String get uuid => _uuid;
  ProfileImageData _photo;
  ProfileImageData get photo => _photo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void addPhotoFile({
    required Color backgroundColor,
    required Color toolbarColor,
  }) async {
    _isLoading = true;

    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    CroppedFile? croppedFile;
    if (pickedFile != null) {
      croppedFile = await _imageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop image',
            toolbarColor: toolbarColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            backgroundColor: backgroundColor,
            hideBottomControls: true,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
            aspectRatioLockEnabled: true,
            resetAspectRatioEnabled: false,
          ),
        ],
      );
    }

    if (croppedFile != null) {
      final pickedCroppedImageAsFile = File(croppedFile.path);
      _photo = ProfileImageData(file: pickedCroppedImageAsFile);
    }

    _isLoading = false;
    notifyListeners();
  }

  void switchProgressIndicator(bool isLoading) {
    if (_isLoading != isLoading) {
      _isLoading = isLoading;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    print('disposing $uuid');
    super.dispose();
  }

  void updatePhotoUrl(String url) {
    _photo = ProfileImageData(url: url);
    switchProgressIndicator(false);
    // notifyListeners();
  }

  void removePhoto() {
    _photo = ProfileImageData.empty(
        // order: _orderOfManager,
        );
    notifyListeners();
  }
}

class ProfileImageData {
  final String? url;
  final File? file;

  ProfileImageData({
    this.url,
    this.file,
  });

  ProfileImageData.empty() : this();
}
