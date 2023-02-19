import 'package:flutter/material.dart';
import 'package:izimemo/custom/custom_constants.dart';

import '../colors/custom_design_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLines,
    this.maxLength,
  });

  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: const InputDecoration(
        filled: true,
        fillColor: CustomDesignColors.lightBlue,
        contentPadding: EdgeInsets.only(top: 32, left: 20, right: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: CustomDesignColors.lightBlue, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: CustomDesignColors.lightBlue, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: CustomDesignColors.lightBlue, width: 1),
        ),
      ),
    );
  }
}
