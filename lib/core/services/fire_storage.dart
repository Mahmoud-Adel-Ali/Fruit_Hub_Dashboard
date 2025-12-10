import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

import 'storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    final fileName = b.basename(file.path);
    final fileExtension = b.extension(file.path);
    final reference = storageReference.child("$path/$fileName.$fileExtension");
    final uploadTask = await reference.putFile(file);

    var fileUrl = await uploadTask.ref.getDownloadURL();
    return fileUrl;
  }

  @override
  Future<bool> deleteFile({required String filePath}) async {
    try {
      final ref = storageReference.child(filePath);
      await ref.delete();

      return true;
    } catch (e) {
      log("Error deleting file: $e");
      return false;
    }
  }
}
