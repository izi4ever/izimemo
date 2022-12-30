import 'package:flutter/material.dart';

import '../colors/custom_bookmark_colors.dart';

class CustomBookmarkButton extends StatelessWidget {
  final String title;
  final String url;
  const CustomBookmarkButton({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final colorsNumber = CustomBookmarkColors.values.length;
    return ElevatedButton(
      onPressed: () {
        print('url: $url');
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: CustomBookmarkColors.values[(url.length + colorsNumber) % colorsNumber].color,
        foregroundColor: Colors.grey[700],
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
