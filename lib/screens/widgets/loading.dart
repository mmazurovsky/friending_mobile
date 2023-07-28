import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../common/bag/stateful/theme.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        child: const MyLoadingIndicator(),
      ),
    );
  }
}

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      width: 27,
      child: PlatformCircularProgressIndicator(
        cupertino: (context, platform) => CupertinoProgressIndicatorData(
          radius: 12,
        ),
        material: (context, platform) => MaterialProgressIndicatorData(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            context.theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
