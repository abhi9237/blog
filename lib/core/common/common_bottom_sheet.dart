import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'common_widget.dart';

void showImagePickerBottomSheet(
    BuildContext context, {
      required Function(XFile file) onImagePicked,
      ImagePicker? picker,
    }) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),

            BottomSheetItem(
              icon: Icons.camera_alt,
              title: 'Camera',
              onTap: () async {
                Navigator.pop(context);
                final XFile? image =
                await picker?.pickImage(source: ImageSource.camera);
                if (image != null) {
                  onImagePicked(image);
                }
              },
            ),

            BottomSheetItem(
              icon: Icons.photo_library,
              title: 'Gallery',
              onTap: () async {
                Navigator.pop(context);
                final XFile? image =
                await picker?.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  onImagePicked(image);
                }
              },
            ),

            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}