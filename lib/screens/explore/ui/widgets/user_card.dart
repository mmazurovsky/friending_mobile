import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/bag/spaces.dart';
import '../../../../common/bag/stateful/styles.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/data/models/user_models.dart';
import '../../../../common/navigation/auto_router/app_router.dart';
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
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.colors.containerColor,
          borderRadius: BorderRadius.circular(ConstRadiuses.card),
          border: Border.all(color: context.colors.border, width: 2),
        ),
        margin: CEdgeInsets.horizontalStandart,
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 15,
        //   vertical: 15,
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      ConstRadiuses.card-2,
                    ),
                    topRight: Radius.circular(
                      ConstRadiuses.card-2,
                    ),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(user.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: CEdgeInsets.horizontalStandart,
              child: Column(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
