import 'dart:io';

import 'package:best_seller/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerClass {
  
  File? imagefile;
  //**************************************Function to pick image from gallery*************************************
  void pickingImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
   
  }
  //**************************************Function to pick image from Camera*************************************

  void pickingImageFromCamera() async {
    final ImagePicker pickerCamera = ImagePicker();

    await pickerCamera
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
  }

  //**************************************Function to  crop image*************************************

  

  cropImage(File imagFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagFile.path,
      compressQuality: 100,
      maxWidth:700,
      maxHeight: 700,
      compressFormat: ImageCompressFormat.jpg,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Cropper",
            toolbarColor: logoBlue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "cropper",
        ),
      ],
    );
    if (croppedFile != null) {
      imageCache.clear();
      imagefile = File(croppedFile.path);
    }
  }

  //**************************************Function to Show Bottom sheet*************************************

  Future<dynamic> showBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: () {
                pickingImageFromCamera();
              },
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
            ),
            ListTile(
              onTap: () {
                pickingImageFromGallery();
              },
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
            ),
            
          ],
        );
      },
    );
  }
}
