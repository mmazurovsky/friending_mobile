import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../other_user/state/button_with_states_manager.dart';
import '../custom_edge_insets.dart';

class ButtonWithStatesWidget extends StatelessWidget {
  final String id;
  const ButtonWithStatesWidget(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    final buttonManager = context.watch<ButtonWithStatesManager>();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: CEdgeInsets.horizontalStandart,
        child: PlatformElevatedButton(
          onPressed: buttonManager.getOnTap(id),
          child: buttonManager.buttonContent,

          // Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: context.theme.cardColor,
          //   ),
          //   child: Center(child: buttonManager.buttonContent),
          // ),
        ),
      ),
    );
  }
}
