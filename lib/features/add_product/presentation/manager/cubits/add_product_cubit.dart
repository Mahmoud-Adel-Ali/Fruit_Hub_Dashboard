import 'package:bloc/bloc.dart';

import '../../../../../core/repos/images_repo/images_repo.dart';
import '../../../../../core/repos/products_repo/product_repo.dart';
import '../../../domain/entities/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productRepo})
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct({
    required ProductEntity addProductInputEntity,
  }) async {
    emit(AddProductLoading());
    //* the var is used when failed to add product date [for delete the image]
    String filePath = '';
    final uploadImageResult = await imagesRepo.uploadImage(
      image: addProductInputEntity.image,
    );
    uploadImageResult.fold(
      (failure) => emit(AddProductFailure(message: failure.message)),
      (url) async {
        filePath = url;

        addProductInputEntity = addProductInputEntity.copyWith(imgUrl: url);
        
        final result = await productRepo.addProduct(
          addProductInputEntity: addProductInputEntity,
        );

        result.fold(
          (failure) {
            
            imagesRepo.deleteImage(filePath: filePath);
            emit(AddProductFailure(message: failure.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
