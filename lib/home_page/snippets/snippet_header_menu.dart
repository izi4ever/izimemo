import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom/colors/custom_design_colors.dart';
import '../../custom/custom_constants.dart';

class SnippetHeaderMenu extends StatelessWidget {
  final String releaseNo;
  final VoidCallback onLogoPressed;
  final VoidCallback onLikePressed;
  final VoidCallback onSharedPressed;
  final VoidCallback onQRPressed;

  const SnippetHeaderMenu({
    super.key,
    required this.releaseNo,
    required this.onLogoPressed,
    required this.onLikePressed,
    required this.onSharedPressed,
    required this.onQRPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: CustomDesignColors.darkBlue,
          ),
          child: Center(
            child: GestureDetector(
              onTap: onLogoPressed,
              child: Column(
                children: [
                  Image.asset(
                    'assets/izimemo_logo_big_white.png',
                    height: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Izimemo',
                    style: GoogleFonts.lobster(
                      textStyle: const TextStyle(color: CustomDesignColors.lightBlue, fontSize: 22),
                    ),
                  ),
                  Text(
                    'slogan'.tr,
                    style: const TextStyle(color: CustomDesignColors.lightBlue, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 54,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
              color: Colors.white,
            ),
            child: Text(
              releaseNo,
              style: const TextStyle(color: CustomDesignColors.darkBlue, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 18,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onLikePressed,
                icon: const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 14,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: onSharedPressed,
                    icon: const Icon(
                      Icons.share,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 14),
                ],
              ),
              IconButton(
                onPressed: onQRPressed,
                icon: const Icon(
                  Icons.qr_code_2,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 7,
          child: Container(
            height: CustomConstants.webviewRadius,
            decoration: const BoxDecoration(
              color: CustomDesignColors.lightBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(500, 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
