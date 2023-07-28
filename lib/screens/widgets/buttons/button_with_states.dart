import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/theme.dart';
import '../../other_user/state/button_with_states_manager.dart';

class ButtonWithStates<MANAGER extends ButtonWithStatesManager> extends StatelessWidget {
  const ButtonWithStates({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonManager = context.watch<MANAGER>();
    return InkWell(
      onTap: buttonManager.onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.theme.cardColor,
        ),
        child: Center(child: buttonManager.buttonContent),
      ),
    );
  }
}
