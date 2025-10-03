import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        flexibleSpace: Container(color: AppColors.white),
      ),
      body: AddProductViewBody(),
    );
  }
}
