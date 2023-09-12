import 'package:flutter/material.dart';

import '../../common/bag/stateful/theme.dart';

extension SnackBarExtension on ScaffoldMessengerState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCSnackBar(CustomSnackBarContent snackBarContent) {
    return showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.black,
        duration: const Duration(milliseconds: 2000),
        // behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        // padding: EdgeInsets.zero,
        content: snackBarContent,
      ),
    );
  }
}

class CustomSnackBarContent extends StatelessWidget {
  final String _message;
  const CustomSnackBarContent(this._message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: ConstSpaces.unit3,
        //     vertical: ConstSpaces.unit4,
        //   ),
        //   alignment: Alignment.centerLeft,
        //   // color: context.colors.snackBarContainerColor,
        //   child:
        Text(
      _message,
      style: TextStyle(
        color: context.colors.snackBarTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.start,
      // ),
    );
  }
}
