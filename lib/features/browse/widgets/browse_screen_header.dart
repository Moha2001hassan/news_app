import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/browse/widgets/search_bar.dart';

import '../../../core/app_rounded_button.dart';

class BrowseScreenHeader extends StatelessWidget {
  const BrowseScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppRoundedButton(
            iconData: CupertinoIcons.left_chevron,
            onTap: () {},
          ),
          const SizedBox(height: 15),
          const Text(
            "Discover",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "News from all around the world",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          const SearchBarTextField(),
        ],
      ),
    );
  }
}
