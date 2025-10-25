import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/services/storage_service.dart';

import '../../errors/failures.dart';
import '../../utils/end_points.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});

  @override
  Future<Either<Failure, String>> uploadImage({required File image}) async {
    try {
      final imageUrl = await storageService.uploadFile(
        file: image,
        path: EndPoints.images,
      );
      return Right(imageUrl);
    } catch (e) {
      log("Failed to upload image: $e");
      return Left(ServerFailure("Failed to upload image."));
    }
  }
}
