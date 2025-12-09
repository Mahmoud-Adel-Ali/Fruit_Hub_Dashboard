import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct({
    required ProductEntity addProductInputEntity,
  });
}
