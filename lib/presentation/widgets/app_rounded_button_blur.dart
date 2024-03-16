import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/presentation/theme/app_colors.dart';

class AppRoundedButtonBlur extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;

  const AppRoundedButtonBlur({super.key, this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: AppColor.white02,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            child: SizedBox(
              width: 53,
              height: 53,
              child: Icon(iconData,color: AppColor.black),
            ),
          ),
        ),
      ),
    );
  }
}
