import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const HomeHeading({super.key, this.trailing, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
