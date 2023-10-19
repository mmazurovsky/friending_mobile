import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/theme.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../profile/state/points_change_notifier.dart';
import '../../profile/state/short_profile_change_notifier.dart';
import '../image/my_cached_network_image.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<PointsChangeNotifier>().pointsCount;
    final userAvatar = context.watch<ShortProfileChangeNotifier>().user?.avatar;
    return IconButton(
      // padding: EdgeInsets.only(right: 3),

      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.only(right: 7.0),
        child: Container(
          // width: 90,
          padding: const EdgeInsets.only(
            left: 20,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                // transform: GradientRotation(0.5),
                colors: [
                  // Color.fromARGB(255, 251, 237, 254),
                  // Colors.transparent,
                  // context.colors.appBarColor,
                  Color.fromARGB(255, 200, 26, 26),
                  Color.fromARGB(255, 87, 4, 4),
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
              Text(
                '$value',
                style: context.styles.bodyBold,
                // .copyWith(color: context.colors.onContainerTextColor),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                //TODO: placeholder
                child: CCachedNetworkImage(
                  userAvatar,
                  errorWidget: Container(
                    color: context.colors.backgroundColor,
                    padding: EdgeInsets.all(5),
                    child: const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
