import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/cubits/add_product_cubit.dart';

import '../../../../core/repos/images_repo/images_repo.dart';
import '../../../../core/repos/products_repo/product_repo.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_progress_hub.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imagesRepo: getit.get<ImagesRepo>(),
        productRepo: getit.get<ProductRepo>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text('Add Product'),
          centerTitle: true,
          backgroundColor: AppColors.white,
          flexibleSpace: Container(color: AppColors.white),
        ),
        body: AddProductCubitBlocConsumer(),
      ),
    );
  }
}

class AddProductCubitBlocConsumer extends StatelessWidget {
  const AddProductCubitBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product Added Successfully!')),
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHub(
          isLoading: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
