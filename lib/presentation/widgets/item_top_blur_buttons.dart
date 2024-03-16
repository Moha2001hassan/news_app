import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/news_web_page.dart';
import 'app_rounded_button_blur.dart';

class ItemTopBlurButtons extends StatelessWidget {
  final String url;
  final String publisher;

  const ItemTopBlurButtons({
    super.key,
    required this.url,
    required this.publisher,
  });

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
          iconData: Icons.web,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsWebPage(
                  publisher: publisher,
                  url: url,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
