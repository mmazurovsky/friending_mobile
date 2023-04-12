import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ionicons/ionicons.dart';

@lazySingleton
class ProfileImagesManager with ChangeNotifier {
  final int _orderOfManager;
  ProfileImagesManager(
    this._orderOfManager,
    this._photo,
  );
  ProfileImageData _photo;
  ProfileImageData get photo => _photo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void onTap() {
    
  }

  void addPhotoFile(File file) {
    _isLoading = true;
    //TODO: ADD LOGIC HERE
    _photo = ProfileImageData(file: file);
    _isLoading = false;
    notifyListeners();
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
  // final int order;

  ProfileImageData({
    this.url,
    this.file,
    // required this.order,
  });

  ProfileImageData.empty(
    // {
    // required int order,
  // }
  ) : this(
    // order: order,
    );

  Widget contentImage({required Color backgroundColor}) {
    if (url != null) {
      return Image.network(url!);
    } else if (file != null) {
      return Image.file(file!);
    } else {
      return Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: const Icon(
          Ionicons.add_circle_outline,
          size: 30,
        ),
      );
    }
  }
}
