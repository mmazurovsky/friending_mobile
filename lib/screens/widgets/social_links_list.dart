import 'package:flutter/material.dart';

import '../../common/data/models/user_models.dart';
import 'buttons/button_with_icons.dart';

class SocialLinksList extends StatelessWidget {
  final List<SecureUserInfoFieldModel> fields;
  static const double _verticalPadding = 12;

  const SocialLinksList({
    Key? key,
    required this.fields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fields.isEmpty
        ? Container()
        : Column(
            children: fields
                .map((e) => SocialLinksLine(
                      text: e.title,
                      verticalPadding: _verticalPadding,
                      onTap: e.onTap,
                      logoAsset: e.logoAsset,
                    ))
                .toList(),
          );
  }
}

class SocialLinksLine extends StatelessWidget {
  final String text;
  final String logoAsset;
  final VoidCallback onTap;
  final double verticalPadding;
  const SocialLinksLine({
    super.key,
    required this.text,
    required this.logoAsset,
    required this.onTap,
    required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWithIcons(
      buttonText: text,
      onButtonTap: onTap,
      leadingIcon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              logoAsset,
            ),
          ),
        ),
      ),
      verticalPadding: verticalPadding,
    );
  }
}
