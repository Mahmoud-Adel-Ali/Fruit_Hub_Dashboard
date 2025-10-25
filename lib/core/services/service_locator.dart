import 'package:get_it/get_it.dart';

import 'fire_storage.dart';
import 'storage_service.dart';

final getit = GetIt.instance;

void setupServicesLocator() {
  getit.registerSingleton<StorageService>(FireStorage());
}
