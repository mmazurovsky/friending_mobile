import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/data/entities/user_entities.dart';

class UserTile extends StatelessWidget {
  final ShortUserEntity user;

  const UserTile(
    Key? key, {
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(user.avatar),
      ),
      title: Text(user.nickname),
      subtitle: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: user.commonTags.map(
          (tag) {
            return Chip(
              label: Text(tag),
            );
          },
        ).toList(),
      ),
    );
  }
}
