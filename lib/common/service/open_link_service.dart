import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class OpenLinkService {
  static void openUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      final message = 'Could not launchUrl $urlString';
      log(message);
      throw Exception(message);
    }
  }

  static void openInstagram(String instagramUsername) async {
    final instagramAppLink = "instagram://user?username=$instagramUsername";
    final instagramUrl = Uri.parse(instagramAppLink);
    final isLaunched = await launchUrl(instagramUrl);
    if (!isLaunched) {
      openUrl(
        SocialLinksHelper.getInstagramLinkForNickname(instagramUsername),
      );
    }
  }

  static void openSoundcloud(String soundcloudUsername) async {
    openUrl(
      SocialLinksHelper.getSoundcloudLinkForNickname(soundcloudUsername),
    );
  }

  static void openTelegram(String telegramUsername) async {
    final telegramAppLink = "tg://msg?text=&to=@$telegramUsername";
    final telegramUrl = Uri.parse(telegramAppLink);
    final isLaunched = await launchUrl(telegramUrl);
    if (!isLaunched) {
      openUrl(
        SocialLinksHelper.getInstagramLinkForNickname(telegramUsername),
      );
    }
  }
}

class SocialLinksHelper {
  static String getInstagramLinkForNickname(String nickname) {
    return 'https://instagram.com/$nickname';
  }

  static String getTelegramLinkForNickname(String nickname) {
    return 'https://t.me/$nickname';
  }

  static String getBandcampLinkForNickname(String nickname) {
    return 'https://$nickname.bandcamp.com';
  }

  static String getSoundcloudLinkForNickname(String nickname) {
    return 'https://soundcloud.com/$nickname';
  }
}
