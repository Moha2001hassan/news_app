import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_rounded_button_blur.dart';

class ItemTopBlurButtons extends StatelessWidget {
  const ItemTopBlurButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        AppRoundedButtonBlur(
          iconData: CupertinoIcons.left_chevron,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        AppRoundedButtonBlur(
          iconData: CupertinoIcons.bookmark,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        AppRoundedButtonBlur(
          iconData: Icons.more_horiz,
          onTap: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
