import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/bag/spaces.dart';
import '../../../../common/bag/stateful/styles.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/data/models/user_models.dart';
import '../../../../common/navigation/auto_router/app_router.dart';
import '../../../profile/ui/widgets/tags_displayer.dart';
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
          // border: Border.all(color: context.colors.border, width: 2),
        ),
        // margin: CEdgeInsets.horizontalStandart,
        // padding: const EdgeInsets.symmetric(
        //   horizontal: 15,
        //   vertical: 15,
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child:
                  // ClipRRect(
                  //   borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(
                  //       ConstRadiuses.card - 2,
                  //     ),
                  //     topRight: Radius.circular(
                  //       ConstRadiuses.card - 2,
                  //     ),
                  //   ),
                  //   child:
                  Container(
                margin: CEdgeInsets.horizontalSmall.copyWith(top: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                  // border: Border(
                  //   bottom: BorderSide(color: context.colors.border, width: 2),
                  // ),
                  borderRadius: BorderRadius.circular(ConstRadiuses.card),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(user.avatar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // ),
            Expanded(
              child: Container(
                padding: CEdgeInsets.horizontalSmall,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        CustomWrap(
                          maxLines: 2,
                          children: user.tagsEntities.map(
                            (tagData) {
                              return CustomChip(
                                tagData: tagData,
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
