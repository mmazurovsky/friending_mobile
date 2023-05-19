import 'package:flutter/material.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/profile_repo.dart';
import 'profile_editing_page.dart';
import 'this_user_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt<ProfileRepo>().getProfileStream(),
      builder: ((context, AsyncSnapshot<ShortReadUserModel?> snapshot) =>
          snapshot.hasData
              ? ThisUserProfilePage(shortProfile: snapshot.data!)
              : const ProfileEditingPage()),
    );
  }
}
