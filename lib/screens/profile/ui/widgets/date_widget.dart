import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../state/profile_editing_manager.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final manager = context.read<ProfileEditingManager>();
        final pickedDate = await showPlatformDatePicker(
            context: context,
            initialDate: manager.birthDate ?? DateTime(2007, 1, 1),
            firstDate: DateTime(1930, 1, 1),
            lastDate: DateTime(2007, 1, 1));
        if (pickedDate != null) {
          manager.changeBirthDate(pickedDate);
        }
      },
      child: TextField(
        readOnly: true,
        controller: context.watch<ProfileEditingManager>().birthDateController,
      ),
    );
  }
}
