import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

class StoreData {
  Future<String> uploadImagetoStorage(String profile, Uint8List file) async {
    Reference ref = firebaseStorage.ref().child(profile);
    UploadTask uploadtask = ref.putData(file);
    TaskSnapshot snapshot = await uploadtask;
    String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
