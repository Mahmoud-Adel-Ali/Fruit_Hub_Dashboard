import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/add_product_input_entity.dart';
import '../../errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  });
}
