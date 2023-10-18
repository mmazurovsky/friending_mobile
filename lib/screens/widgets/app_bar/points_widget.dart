import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../profile/state/points_change_notifier.dart';
import '../../profile/state/profile_content_manager.dart';
import '../image/my_cached_network_image.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<PointsChangeNotifier>().pointsCount;
    final userAvatar = context.watch<ProfileContentManager>().profile.shortUserModel.avatar;
    return IconButton(
      // padding: EdgeInsets.only(right: 3),

      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.only(right: 7.0),
        child: Container(
          // width: 90,
          padding: const EdgeInsets.only(
            left: 14,
            right: 3,
            top: 3,
            bottom: 3,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                // transform: GradientRotation(0.5),
                colors: [
                  // Color.fromARGB(255, 251, 237, 254),
                  // Colors.transparent,
                  // context.colors.appBarColor,
                  Color.fromARGB(255, 200, 26, 26),
                  Color.fromARGB(255, 115, 7, 7),
                  // Color.fromARGB(255, 145, 0, 0),
                ]),
            // color: context.colors.activeIndicatorColor,

            //
            //Color.fromARGB(255, 251, 255, 0),
            // context.colors.appBarAction,
            borderRadius: BorderRadius.circular(20),
          ),
          // alignment: Alignment.center,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                color: context.colors.accentToBackgroundColor,
                width: 18,
                height: 18,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 0.5),
              Text(
                '$value',
                style: context.styles.bodyBold,
                // .copyWith(color: context.colors.onContainerTextColor),
              ),
              const SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                //TODO: placeholder
                child: CCachedNetworkImage(userAvatar),
              )
            ],
          ),
        ),
      ),
    );
  }
}
