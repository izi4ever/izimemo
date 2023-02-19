import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izimemo/custom/custom_constants.dart';

import '../colors/custom_design_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
  });

  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final MaxLengthEnforcement? maxLengthEnforcement;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
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
