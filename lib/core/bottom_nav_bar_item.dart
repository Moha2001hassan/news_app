import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

class BottomNavBarItem extends StatelessWidget {
  final String text;
  final bool isActive;
  final Function() onTap;
  final IconData activeIconData;
  final IconData iconData;

  const BottomNavBarItem({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
    required this.activeIconData,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? activeIconData : iconData,
              color: isActive ? AppColor.white : AppColor.osloGray,
            ),
            Text(
              isActive ? " $text" : "",
              style: TextStyle(
                color: isActive ? AppColor.white : AppColor.osloGray,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
