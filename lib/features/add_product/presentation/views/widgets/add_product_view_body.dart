import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
              ),
              CustomTextFormField(
                hintText: 'price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                hintText: 'code',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                hintText: 'description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
