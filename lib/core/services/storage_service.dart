import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile({required File file, required String path});
  Future<bool> deleteFile({required String filePath});
}
