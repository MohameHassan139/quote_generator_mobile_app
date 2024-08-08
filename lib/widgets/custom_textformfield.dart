import 'package:flutter/material.dart';

import '../../../../../../constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  IconButton? suffix;
  final TextInputType? fieldType;
  final TextEditingController? textController;
  bool? ispassword = false;
  final void Function()? onTap;
  bool? readOnly = false;
  CustomTextFormField({
    super.key,
    required this.textController,
    this.onChange,
    this.suffix,
    this.validator,
    this.ispassword,
    this.fieldType,
    this.onTap,
    this.hintText,
    this.prefixIcon,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      onTap: onTap,
      keyboardType: fieldType,
      validator: validator,
      onChanged: onChange,
      obscureText: ispassword ?? false,
      controller: textController,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hintText,
        filled: true,
        prefixIcon: prefixIcon,

        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),

        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.KgreyColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))),

        fillColor: AppColors.KwhiteColor,

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.KgreyColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),

        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10))),

        // error focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 1,
      ),
    );
  }
}
