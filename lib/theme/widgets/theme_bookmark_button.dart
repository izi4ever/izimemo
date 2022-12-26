import 'package:flutter/material.dart';

import '../theme_bookmark_colors.dart';

class ThemeBookmarkButton extends StatelessWidget {
  final String title;
  final String url;
  const ThemeBookmarkButton({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final colorsNumber = ThemeBookmarkColors.values.length;
    return ElevatedButton(
      onPressed: () {
        print('url: $url');
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: ThemeBookmarkColors.values[(url.length + colorsNumber) % colorsNumber].color,
        foregroundColor: Colors.grey[700],
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
