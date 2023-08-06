import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/bag/stateful/styles.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/data/models/user_models.dart';
import '../../../../common/navigation/auto_router/app_router.dart';
import '../../../widgets/buttons/trailing_arrow_icon.dart';
import '../../../widgets/custom_edge_insets.dart';

class UserCard extends StatelessWidget {
  final ShortReadUserModel user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        OtherUserProfileRoute(
          shortProfile: user,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.containerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: CEdgeInsets.horizontalStandart,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(user.avatar),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: user.username,
                          style: context.styles.userCardUsername,
                        ),
                        TextSpan(
                          text: ', ${user.age}',
                          style: context.styles.userCardAge,
                        ),
                      ],
                    ),
                  ),
                  if (user.commonTags.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: user.commonTags.map(
                        (tag) {
                          return Text(tag);
                        },
                      ).toList(),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const TrailingArrowIcon(),
          ],
        ),
      ),
    );
  }
}
