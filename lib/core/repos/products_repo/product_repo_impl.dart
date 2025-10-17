import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/add_product_input_entity.dart';
import '../../errors/failures.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, String>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
