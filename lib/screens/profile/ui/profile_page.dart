import 'package:flutter/material.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/profile_repo.dart';
import 'profile_editing_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt<ProfileRepo>().getProfileStream(),
      initialData: null,
      builder: (context, AsyncSnapshot<ShortReadUserModel?> snapshot) {
        if (snapshot.hasData) {
          //TODO show ok message in button before switching widget
          return Container(color: Colors.blue);
        } else {
          return const ProfileEditingPage();
        }
      },
    );
  }
}
