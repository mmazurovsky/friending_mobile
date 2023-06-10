import 'package:flutter/material.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/bag/stateful/theme.dart';
import 'button_content.dart';
import 'trailing_arrow_icon.dart';

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
          trailing: trailingIcon ?? const TrailingArrowIcon(),
          textStyle: context.theme.textTheme.bodyLarge!,
        ),
      ),
    );
  }
}
