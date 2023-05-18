import 'package:flutter/material.dart';

import '../../../common/bag/stateful/theme.dart';

class SectionDivider extends StatelessWidget {
  final EdgeInsets? edgeInsets;
  const SectionDivider({
    Key? key,
    this.edgeInsets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return edgeInsets != null
        ? Padding(padding: edgeInsets!, child: _MyDivider())
        : _MyDivider();
  }
}

class _MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.theme.dividerColor,
      thickness: 1,
      height: 0.5,
    );
  }
}
