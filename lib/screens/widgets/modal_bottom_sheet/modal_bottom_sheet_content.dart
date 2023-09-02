import 'package:flutter/material.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../custom_edge_insets.dart';

class ModalBottomSheetContent extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Widget content;
  final double height;

  const ModalBottomSheetContent({
    Key? key,
    required this.iconData,
    required this.title,
    required this.content,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: context.colors.dialogBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: CEdgeInsets.horizontalStandart,
            child: Column(
              children: [
                const SizedBox(height: 8),
                Container(
                  width: 30,
                  height: 4,
                  color: Colors.grey,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 3),
                    Icon(
                      iconData,
                      size: 24,
                      color: context.colors.staticIconsColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: context.styles.genericHeader,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}
