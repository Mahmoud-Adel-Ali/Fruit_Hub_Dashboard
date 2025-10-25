import 'package:firebase_storage/firebase_storage.dart';

import 'storage_service.dart';

class FireStorage implements StorageService {
  final storage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage({required String fileBase64}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
