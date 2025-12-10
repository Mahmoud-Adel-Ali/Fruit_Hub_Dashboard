import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PickImageField extends StatefulWidget {
  const PickImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<PickImageField> createState() => _PickImageFieldState();
}

class _PickImageFieldState extends State<PickImageField> {
  XFile? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        isLoading = true;
        setState(() {});
        final ImagePicker picker = ImagePicker();
        image = await picker.pickImage(source: ImageSource.gallery);
        widget.onFileChanged(image != null ? File(image!.path) : null);
        isLoading = false;
        setState(() {});
      },
      child: Skeletonizer(
        enabled: isLoading,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1.5, color: AppColors.grey),
              ),
              child: image != null
                  ? Image.file(File(image!.path), fit: BoxFit.fill)
                  : Icon(Icons.image_outlined, size: 180),
            ),
            // remove image
            Visibility(
              visible: image != null,
              child: IconButton(
                onPressed: () {
                  image = null;
                  widget.onFileChanged(null);
                  setState(() {});
                },
                icon: Icon(Icons.close, color: AppColors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
