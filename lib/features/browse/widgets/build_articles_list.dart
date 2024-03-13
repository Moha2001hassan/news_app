import 'package:flutter/material.dart';

class BuildArticlesList extends StatelessWidget {
  const BuildArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("test"),
          onTap: () {
            // Handle article tap
          },
        );
      },
    );
  }
}
