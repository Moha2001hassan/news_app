import 'package:flutter/material.dart';

import '../../../core/app_rounded_button.dart';

class HomeTopButtons extends StatelessWidget {
  const HomeTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: Row(
          children: [
            AppRoundedButton(
              iconData: Icons.menu,
              onTap: () {},
            ),
            const Spacer(),
            AppRoundedButton(
              iconData: Icons.search,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            AppRoundedButton(
              iconData: Icons.notifications_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
