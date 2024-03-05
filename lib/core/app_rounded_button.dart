import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;

  const AppRoundedButton({super.key, this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: AppColor.athenasGray,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: SizedBox(
          width: 53,
          height: 53,
          child: Icon(iconData),

        ),
      ),
    );
  }
}
