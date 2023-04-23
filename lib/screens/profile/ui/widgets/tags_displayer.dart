import 'package:flutter/material.dart';

class TagsDisplayer extends StatelessWidget {
  const TagsDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    // create widget to display tags of profile as wrap with chips
    return Wrap(
      children: [
        // create widget to display tag as chip
        Chip(
          label: Text('tag'),
          onDeleted: () {},
        ),
      ],
    );
  }
}
