import 'package:flutter/material.dart';

import '../../bag/spaces.dart';
import '../../bag/stateful/styles.dart';
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
          horizontal: ConstSpaces.unit3,
          vertical: verticalPadding,
        ),
        child: ButtonContent(
          mainAxisAlignment: MainAxisAlignment.start,
          leading: leadingIcon,
          distanceBetweenLeadingAndText: 13,
          text: buttonText,
          textStyle: context.styles.socialMediaTitle,
          trailing: trailingIcon ?? const TrailingArrowIcon(),
        ),
      ),
    );
  }
}
