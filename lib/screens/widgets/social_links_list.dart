import 'package:flutter/material.dart';

import '../../common/assets/assets.dart';
import '../../common/service/open_link_service.dart';
import 'buttons/button_with_icons.dart';

class SocialLinksList extends StatelessWidget {
  final String? instagramUsername;
  final String? soundcloudUsername;
  final String? telegramUsername;
  static const double _verticalPadding = 10;

  const SocialLinksList({
    Key? key,
    this.instagramUsername,
    this.soundcloudUsername,
    this.telegramUsername,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return instagramUsername != null ||
            soundcloudUsername != null ||
            telegramUsername != null
        ? Column(
            children: [
              soundcloudUsername != null
                  ? SocialLinksLine(
                      text: 'Soundcloud',
                      logoAsset: ImageAssets.soundcloudLogo,
                      onTap: () => () => OpenLinkService.openSoundcloud(
                            soundcloudUsername!,
                          ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              instagramUsername != null
                  ? SocialLinksLine(
                      text: 'Instagram',
                      logoAsset: ImageAssets.instagramLogo,
                      onTap: () =>
                          OpenLinkService.openInstagram(instagramUsername!),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              telegramUsername != null
                  ? SocialLinksLine(
                      text: 'Telegram',
                      logoAsset: ImageAssets.telegramLogo,
                      onTap: () => OpenLinkService.openUrl(
                          SocialLinksHelper.getTelegramLinkForNickname(
                              telegramUsername!)),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
            ],
          )
        : Container();
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
