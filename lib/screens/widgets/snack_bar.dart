import 'package:flutter/material.dart';

import '../../common/bag/stateful/spaces.dart';
import '../../common/bag/stateful/theme.dart';

class CustomSnackBarContent extends StatelessWidget {
  final String _message;
  const CustomSnackBarContent(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacesWatch.dynamicUnit1,
        vertical: Spaces.unit1,
      ),
      child: Text(
        _message,
        style: TextStyle(
          color: context.theme.snackBarTheme.actionTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
