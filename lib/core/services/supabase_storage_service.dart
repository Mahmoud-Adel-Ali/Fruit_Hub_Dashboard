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

  @override
  Future<String> uploadFile({
    required File file,
    required String path,
  }) async {
    final client = _supabase.client;

    final fileName = my_path.basename(file.path);
    final fileExtension = my_path.extension(file.path);
    
    final result = await client.storage
        .from('fruits_images') // your storage bucket
        .upload('$path/$fileName.$fileExtension', file);

    log("File uploaded successfully: $result");
    return result;
  }
}
