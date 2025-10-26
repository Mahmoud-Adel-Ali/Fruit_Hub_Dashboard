import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.inputFormatters,
  });
  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      obscureText: obscureText ?? false, // show_Text or no
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      style: AppTextStyles.semiBold16,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: Color(0xFFF9FAFA),
        filled: true,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: AppColors.hintTextColor,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        focusedBorder: _buildOutlineBorder(),
        errorBorder: errorBorder(context),
        focusedErrorBorder: errorBorder(context),
        enabledBorder: _buildOutlineBorder(color: Color(0xFFE6E9E9)),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder({
    Color color = AppColors.primaryColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: color),
    );
  }

  OutlineInputBorder errorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.red),
    );
  }
}
