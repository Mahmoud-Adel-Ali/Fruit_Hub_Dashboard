import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/products_repo/product_repo.dart';
import '../repos/products_repo/product_repo_impl.dart';
import 'fire_storage.dart';
import 'storage_service.dart';

final getit = GetIt.instance;

void setupServicesLocator() {
  getit.registerSingleton<StorageService>(FireStorage());
  getit.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getit.get<StorageService>()),
  );
  getit.registerSingleton<ProductRepo>(ProductRepoImpl());
}
