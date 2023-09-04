import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/bag/spaces.dart';
import '../../../../common/bag/stateful/styles.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/data/models/user_models.dart';
import '../../../../common/navigation/auto_router/app_router.dart';
import '../../../../common/widgets/custom_edge_insets.dart';
import '../../../../common/widgets/image/my_cached_network_image.dart';
import '../../../profile/ui/widgets/tags_displayer.dart';

class UserCard extends StatelessWidget {
  final ShortReadUserModel user;

  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = CCachedNetworkImage(
      user.avatar,
      generatePaletteFromImage: true,
    );
    return InkWell(
      onTap: () => context.router.push(
        OtherUserProfileRoute(
          shortProfile: user,
        ),
      ),
      child: FutureBuilder<List<Color>>(
        future: image.completer.future,
        initialData: [
          context.colors.containerColor,
          context.colors.containerColor,
        ],
        builder: (context, snapshot) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: snapshot.data!,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(ConstRadiuses.card),
            border: Border.all(
              color: context.colors.border,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow,
                blurRadius: 0,
                spreadRadius: 0,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          // margin: CEdgeInsets.horizontalStandart,
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 15,
          //   vertical: 15,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: CEdgeInsets.horizontalSmall.copyWith(top: 7),
                child: Hero(
                  tag: user.avatar,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ConstRadiuses.card),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: image,
                    ),
                  ),
                ),

                //     Container(
                //   margin: CEdgeInsets.horizontalSmall.copyWith(top: 7),
                //   decoration: BoxDecoration(
                //     // border: Border(
                //     //   bottom: BorderSide(color: context.colors.border, width: 2),
                //     // ),
                //     borderRadius: BorderRadius.circular(ConstRadiuses.card),
                //     image: DecorationImage(
                //       image: CachedNetworkImageProvider(user.avatar),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
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
      ),
    );
  }
}
