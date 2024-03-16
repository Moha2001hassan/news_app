import 'package:flutter/material.dart';
import 'package:news_app/presentation/theme/app_colors.dart';

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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? activeIconData : iconData,
              color: isActive ? AppColor.white : AppColor.darkGray,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isActive? 8 : 0,
              height: 1,
            ),
            Text(
              isActive ? text : "",
              style: TextStyle(
                color: isActive ? AppColor.white : AppColor.darkGray,
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
