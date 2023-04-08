import 'package:flutter/material.dart';

import '../colors/custom_design_colors.dart';
import '../custom_constants.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    this.defaultValueFromItem,
    this.hintText,
    this.hintTextColor = CustomDesignColors.darkBlue,
    this.hintTextSize = 14,
    this.hintTextWeight = FontWeight.w500,
    required this.items,
    this.selectedItemBuilder,
    required this.onChanged,
    this.hintBackgroundColor = CustomDesignColors.lightBlue,
    this.menuBackgroundColor = CustomDesignColors.darkBlue,
    this.onSaved,
    this.validator,
  });

  final String? defaultValueFromItem;
  final String? hintText;
  final Color hintTextColor;
  final double hintTextSize;
  final FontWeight hintTextWeight;
  final List<DropdownMenuItem<String>> items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final void Function(String?) onChanged;
  final Color hintBackgroundColor;
  final Color menuBackgroundColor;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: defaultValueFromItem,
      hint: (hintText != null)
          ? Text(
              hintText!,
              style: TextStyle(
                color: hintTextColor,
                fontSize: hintTextSize,
                fontWeight: hintTextWeight,
              ),
            )
          : null,
      items: items,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: hintBackgroundColor,
        // contentPadding: EdgeInsets.only(top: 32, left: 20, right: 20),
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 8),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: hintBackgroundColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: hintBackgroundColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
          borderSide: BorderSide(color: hintBackgroundColor, width: 1),
        ),
      ),
      // dropdownColor: CustomDesignColors.menuBlue,
      dropdownColor: menuBackgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
      elevation: 0,
    );
  }
}
