import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
    required this.iconWidget,
    required this.containerOpacity,
    required this.onTap,
  }) : super(key: key);

  final double containerOpacity;
  final Icon iconWidget;
  final Function onTap;

  static const _sideSize = 57.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      padding: const EdgeInsets.all(10),
      visualDensity: VisualDensity.standard,
      alignment: Alignment.center,
      constraints: const BoxConstraints(
        minHeight: _sideSize,
        minWidth: _sideSize,
        maxHeight: _sideSize,
        maxWidth: _sideSize,
      ),
      icon: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: containerOpacity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
              ),
            ),
            iconWidget,
          ],
        ),
      ),
    );
  }
}
