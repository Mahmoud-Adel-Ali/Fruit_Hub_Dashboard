import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage({required File image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
