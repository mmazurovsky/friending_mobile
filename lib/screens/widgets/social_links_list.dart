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
                  ? ButtonWithIcons(
                      buttonText: 'Soundcloud',
                      onButtonTap: () => OpenLinkService.openSoundcloud(
                        soundcloudUsername!,
                      ),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              ImageAssets.soundcloudLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              instagramUsername != null
                  ? ButtonWithIcons(
                      buttonText: 'Instagram',
                      onButtonTap: () =>
                          OpenLinkService.openInstagram(instagramUsername!),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              ImageAssets.instagramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
              telegramUsername != null
                  ? ButtonWithIcons(
                      buttonText: 'Telegram',
                      onButtonTap: () => OpenLinkService.openUrl(
                          SocialLinksHelper.getTelegramLinkForNickname(
                              telegramUsername!)),
                      leadingIcon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              ImageAssets.telegramLogo,
                            ),
                          ),
                        ),
                      ),
                      verticalPadding: _verticalPadding,
                    )
                  : Container(),
            ],
          )
        : Container();
  }
}
