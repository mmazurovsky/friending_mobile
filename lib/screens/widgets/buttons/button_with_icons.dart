import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/bag/stateful/theme.dart';
import 'button_content.dart';

class ButtonWithIcons extends StatelessWidget {
  final Widget? leadingIcon;
  final String buttonText;
  final Function onButtonTap;
  final double verticalPadding;
  final Widget? trailingIcon;
  const ButtonWithIcons({
    Key? key,
    this.leadingIcon,
    required this.buttonText,
    required this.onButtonTap,
    required this.verticalPadding,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: context.theme.splashColor,
      onTap: () => onButtonTap(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spaces.unit3,
          vertical: verticalPadding,
        ),
        child: ButtonContent(
          mainAxisAlignment: MainAxisAlignment.start,
          leading: leadingIcon,
          distanceBetweenLeadingAndText: 13,
          text: buttonText,
          trailing: trailingIcon ??
              Icon(
                Ionicons.chevron_forward_outline,
                size: 26,
                color: context.theme.indicatorColor,
              ),
          textStyle: context.theme.textTheme.bodyMedium!,
        ),
      ),
    );
  }
}
