import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/custom_design_colors.dart';
import '../custom_constants.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.hintText,
    this.defaultValue,
    required this.items,
    required this.onChanged,
  });

  final String hintText;
  final String? defaultValue;
  final List<Map<String, String>> items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: defaultValue,
      decoration: const InputDecoration(
        filled: true,
        fillColor: CustomDesignColors.lightBlue,
        contentPadding: EdgeInsets.only(left: 16, right: 8, top: 0, bottom: 0),
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
      hint: Text(
        hintText,
        style: const TextStyle(
          color: CustomDesignColors.darkBlue,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      items: items
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e['key'],
                child: Text(
                  e['text']!,
                  style: const TextStyle(color: Colors.white),
                ),
              ))
          .toList(),
      selectedItemBuilder: (BuildContext context) => items
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e['key'],
                child: Text(
                  e['text']!,
                  style: const TextStyle(
                    color: CustomDesignColors.darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? 'important'.tr : null,
      dropdownColor: CustomDesignColors.darkBlue,
      borderRadius: const BorderRadius.all(Radius.circular(CustomConstants.textFieldRadius)),
      elevation: 0,
    );
  }
}
