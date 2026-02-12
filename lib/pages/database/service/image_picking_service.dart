import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageService {
  /// Pick and crop an image from gallery with fixed aspect ratio
  static Future<Uint8List?> pickAndCropImage({
    required double ratioX,
    required double ratioY,
  }) async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return null;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: true,
          hideBottomControls: false,
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          statusBarLight: false,
          backgroundColor: Colors.grey[900],
          cropFrameColor: Colors.white,
          cropGridColor: Colors.white,
          dimmedLayerColor: Colors.black54,
          showCropGrid: true,
        ),
      ],
    );

    if (croppedFile == null) return null;

    return await File(croppedFile.path).readAsBytes();
  }
}
