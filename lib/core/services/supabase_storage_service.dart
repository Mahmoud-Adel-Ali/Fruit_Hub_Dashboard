import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart' as my_path;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/app_keys.dart';
import 'storage_service.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static Future<void> initialize() async {
    _supabase = await Supabase.initialize(
      url: AppKeys.supabaseUrl,
      anonKey: AppKeys.supabaseAnonKey,
    );
  }

  static Future<void> createBucket(String bucketName) async {
    final client = _supabase.client;
    List<Bucket> buckets = await client.storage.listBuckets();
    bool exists = buckets.any((element) => element.name == bucketName);
    if (!exists) {
      await client.storage.createBucket(
        bucketName,
        BucketOptions(public: true),
      );
    }
  }

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    final client = _supabase.client;

    final fileName = my_path.basename(file.path);
    // final fileExtension = my_path.extension(file.path);

    // ignore: unused_local_variable
    final result = await client.storage
        .from(AppKeys.fruitsImagesBucketName) // your storage bucket
        .upload('$path/$fileName', file);
    // TODo : search about this , how to get file download url
    var publicUrl = client.storage
        .from(AppKeys.fruitsImagesBucketName)
        .getPublicUrl('$path/$fileName');
    log("File uploaded successfully: $publicUrl");
    return publicUrl;
  }
}
