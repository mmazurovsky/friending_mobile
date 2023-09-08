import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_fields.dart';
import '../../state/profile_texts_manager.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  String? _checkBirthDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Birth date is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final manager = context.read<ProfileTextsAndTagsManager>();
        final pickedDate = await showPlatformDatePicker(
            context: context,
            initialDate: manager.birthDate ?? DateTime(2007, 1, 1),
            firstDate: DateTime(1930, 1, 1),
            lastDate: DateTime(2007, 1, 1));
        if (pickedDate != null) {
          manager.changeBirthDate(pickedDate);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: IgnorePointer(
          child: CTextField(
            title: 'Birth date',
            textInputType: TextInputType.none,
            isSecret: false,
            fillColor: Colors.transparent,
            textEditingController:
                context.watch<ProfileTextsAndTagsManager>().birthDateController,
            validatorFunction: _checkBirthDate,
          ),
        ),
      ),
    );
  }
}
