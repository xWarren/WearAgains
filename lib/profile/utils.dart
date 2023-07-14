import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();
XFile? imageFile;
pickImage(ImageSource source) async {
  imageFile = await _picker.pickImage(source: ImageSource.gallery);
  if (imageFile != null) {
    return await imageFile?.readAsBytes();
  }
}

getFromGallery() async {
  final pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    imageFile = XFile(pickedFile.path);
  }
}
