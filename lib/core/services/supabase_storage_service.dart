import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/app_keys.dart';
import 'storage_service.dart';

class SupabaseStorageService implements StorageService {
  static Supabase _supabase = Supabase.instance;
  static Future<void> initialize() async {
    _supabase = await Supabase.initialize(
      url: AppKeys.supabaseUrl,
      anonKey: AppKeys.supabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile({required File file, required String path}) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
