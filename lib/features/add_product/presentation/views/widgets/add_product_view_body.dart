import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';

import '../../../../../core/helper_function/simple_validaton.dart';
import '../../../../../core/helper_function/snack_bar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../domain/entities/add_product_input_entity.dart';
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
  bool isFeatured = false;
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
                controller: price,
                validator: simpleValidator,
              ),
              CustomTextFormField(
                hintText: 'code',
                keyboardType: TextInputType.number,
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
                    AddProductInputEntity item = AddProductInputEntity(
                      name: name.text,
                      price: double.parse(price.text),
                      code: code.text,
                      description: description.text,
                      isFeatured: isFeatured,
                      image: image!,
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
