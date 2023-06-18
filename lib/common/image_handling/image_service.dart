import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as IMG;
import 'package:injectable/injectable.dart';

import '../client/request_check_wrapper.dart';
import '../utils/logger/custom_logger.dart';

abstract class ImageService {
  Future<String> resizeAndUploadImageFileNonWeb({
    required String bucket,
    required String folderName,
    required File imageFile,
  });
  Future<String> resizeAndUploadImageBytes({
    required String bucket,
    required String folderName,
    required Uint8List imageBytes,
  });
}

@LazySingleton(as: ImageService)
class FirebaseImageServiceImpl implements ImageService {
  final FirebaseStorage _firebaseStorage;
  final CustomLogger _logger;
  final RequestCheckWrapper _requestCheckWrapper;

  FirebaseImageServiceImpl(
    this._firebaseStorage,
    this._logger,
    this._requestCheckWrapper,
  );

  Future<String> _uploadImageBytesToFirebase(
      {required String bucket,
      required String folderName,
      required Uint8List imageBytes}) async {
    final refr = _firebaseStorage
        .ref('$bucket/$folderName/image-${DateTime.now().toUtc()}.jpg');

    final uploadTask = refr.putData(
      imageBytes,
      SettableMetadata(contentType: 'image/jpg'),
    );

    final result = await _requestCheckWrapper(uploadTask);

    return result.ref.getDownloadURL();
  }

  @override
  Future<String> resizeAndUploadImageFileNonWeb({
    required String bucket,
    required String folderName,
    required File imageFile,
  }) async {
    final resizedImageAsBytes = ImageResizingService.resizeImageFile(imageFile);

    return _uploadImageBytesToFirebase(
        bucket: bucket,
        folderName: folderName,
        imageBytes: resizedImageAsBytes);
  }

  @override
  Future<String> resizeAndUploadImageBytes({
    required String bucket,
    required String folderName,
    required Uint8List imageBytes,
  }) async {
    final resizedImageAsBytes =
        ImageResizingService.resizeImageBytes(imageBytes);

    return _uploadImageBytesToFirebase(
        bucket: bucket,
        folderName: folderName,
        imageBytes: resizedImageAsBytes);
  }
}

class ImageResizingService {
  static const int resizeTo = 1200;

  static Uint8List resizeImageBytes(Uint8List data) {
    IMG.Image initialImage = IMG.decodeImage(data)!;

    IMG.Image resized = initialImage;

    if (initialImage.height > resizeTo) {
      resized = IMG.copyResize(
        initialImage,
        height: resizeTo,
        interpolation: IMG.Interpolation.linear,
      );
    } else if (initialImage.width > resizeTo) {
      resized = IMG.copyResize(initialImage, width: resizeTo);
    }
    final resizedData = IMG.encodeJpg(resized, quality: 80);
    return Uint8List.fromList(resizedData);
  }

  static Uint8List resizeImageFile(File file) {
    return resizeImageBytes(file.readAsBytesSync());
  }
}
