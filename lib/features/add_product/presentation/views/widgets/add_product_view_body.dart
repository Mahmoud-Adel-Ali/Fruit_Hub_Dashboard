import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';

import '../../../../../core/helper_function/simple_validaton.dart';
import '../../../../../core/helper_function/snack_bar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../domain/entities/product_entity.dart';
import '../../manager/cubits/add_product_cubit.dart';
import 'labeled_checkbox.dart';
import 'pick_image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // controllers
  var name = TextEditingController();
  var price = TextEditingController();
  var code = TextEditingController();
  var description = TextEditingController();
  var expirationMonths = TextEditingController();
  var numOfCalories = TextEditingController();
  var unitAmount = TextEditingController();
  bool isFeatured = false, isOrganic = false;
  File? image;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                hintText: 'name',
                keyboardType: TextInputType.text,
                controller: name,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'price',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: price,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'code',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: code,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'description',
                keyboardType: TextInputType.text,
                maxLines: 5,
                controller: description,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'expiration months',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: expirationMonths,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'num of calories',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: numOfCalories,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'unit amount',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: unitAmount,
                validator: simpleValidator,
              ),
              Row(
                children: [
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Is Featured Item ?',
                      value: false,
                      onChanged: (val) {
                        isFeatured = val;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabeledCheckbox(
                      label: 'Is Product Organic ?',
                      value: false,
                      onChanged: (val) {
                        isOrganic = val;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              PickImageField(
                onFileChanged: (file) {
                  image = file;
                  setState(() {});
                },
              ),
              SizedBox(height: 32),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (formKey.currentState!.validate() && image != null) {
                    formKey.currentState!.save();
                    ProductEntity item = ProductEntity(
                      name: name.text,
                      price: double.parse(price.text),
                      code: code.text,
                      description: description.text,
                      isFeatured: isFeatured,
                      image: image!,
                      expirationMonths: int.parse(expirationMonths.text),
                      isOrganic: isOrganic,
                      numOfCalories: int.parse(numOfCalories.text),
                      unitAmount: int.parse(unitAmount.text),
                    );

                    context.read<AddProductCubit>().addProduct(
                      addProductInputEntity: item,
                    );
                  } else if (image == null) {
                    showErrorSnackBar(context, msg: 'Please select an image');
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
