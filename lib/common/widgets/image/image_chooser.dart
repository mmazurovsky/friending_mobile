import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../dependency_injection/dependency_injection.dart';
import 'my_cached_network_image.dart';

class ProfileImageChooser extends StatefulWidget {
  final void Function(File) pickImage;
  final void Function() onTap;
  final CCachedNetworkImage? initialImage;
  const ProfileImageChooser({
    Key? key,
    required this.pickImage,
    required this.onTap,
    this.initialImage,
  }) : super(key: key);

  @override
  _ProfileImageChooserState createState() => _ProfileImageChooserState();
}

class _ProfileImageChooserState extends State<ProfileImageChooser> {
  final _imagePicker = getIt<ImagePicker>();
  final _imageCropper = getIt<ImageCropper>();
  Image? _pickedImage;

  Future<void> getImage() async {
    File pickedCroppedImageAsFile;

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
            toolbarColor: context.read<ThemeData>().colorScheme.background,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            backgroundColor: context.read<ThemeData>().colorScheme.background,
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
      pickedCroppedImageAsFile = File(croppedFile.path);
      widget.pickImage(pickedCroppedImageAsFile);
      setState(() {
        _pickedImage = Image.file(
          pickedCroppedImageAsFile,
          fit: BoxFit.cover,
        );
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: () {
        widget.onTap();
        getImage();
      },
      child: Text('Choose photo'),
    );
  }
}
