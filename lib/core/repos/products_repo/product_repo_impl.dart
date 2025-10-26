import 'package:dartz/dartz.dart';

import '../../../features/add_product/data/models/add_product_input_model.dart';
import '../../../features/add_product/domain/entities/add_product_input_entity.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import '../../utils/end_points.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    try {
      await databaseService.addData(
        path: EndPoints.addProductsCollection,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to add product."));
    }
  }
}
