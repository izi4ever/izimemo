import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors/custom_design_colors.dart';

class CustomSocialButtonInMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  const CustomSocialButtonInMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: FaIcon(
        icon,
        color: CustomDesignColors.greyBlue,
        size: 18,
      ),
      label: Text(
        title,
        style: const TextStyle(
          color: CustomDesignColors.darkBlue,
        ),
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(0, 0)),
    );
  }
}
