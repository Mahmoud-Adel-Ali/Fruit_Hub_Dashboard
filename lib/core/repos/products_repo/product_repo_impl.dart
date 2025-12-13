import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../features/add_product/data/models/product_model.dart';
import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import '../../utils/end_points.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProduct({
    required ProductEntity addProductInputEntity,
  }) async {
    try {
      var jsonData = ProductModel.fromEntity(addProductInputEntity).toJson();
      log("Json Data is : $jsonData");
      await databaseService.addData(
        path: EndPoints.addProductsCollection,
        data: jsonData,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add product."));
    }
  }
}
