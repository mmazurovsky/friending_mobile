import 'package:flutter/material.dart';

import '../../../common/bag/stateful/styles.dart';
import '../custom_edge_insets.dart';

class ProfileUsernameAndAge extends StatelessWidget {
  const ProfileUsernameAndAge({Key? key, required this.title, required this.age}) : super(key: key);

  final String title;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: context.styles.userScreenNickname,
              ),
              TextSpan(
                text: ', ${age}',
                style: context.styles.userScreenAge,
              ),
            ],
          ),
        ),

        // Text(
        //   title,
        //   style: context.styles.genericHeader,
        //   maxLines: 1,
        //   overflow: TextOverflow.fade,
        // ),
      ),
    );
  }
}
