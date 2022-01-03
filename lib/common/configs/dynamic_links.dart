import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/repo/auth_repo.dart';
import '../auth/state/cubit/auth_cubit.dart';
import '../constants/constants.dart';
import '../data/user.dart';
import '../navigation/navigation_tab.dart';
import '../navigation/state.dart';

import '../../dependency_injection.dart';

class DynamicLinksConfigWidget extends StatefulWidget {
  final Widget child;
  const DynamicLinksConfigWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<DynamicLinksConfigWidget> createState() =>
      _DynamicLinksConfigWidgetState();
}

class _DynamicLinksConfigWidgetState extends State<DynamicLinksConfigWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DynamicLinkService.initDynamicLinks(serviceLocator(), context,
        context.watch<CurrentTabChangeNotifier>().currentTab);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class DynamicLinkService {
  static void initDynamicLinks(
    AuthRepo firebaseAuthRepository,
    BuildContext context,
    NavigationTab currentTab,
  ) async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        if (firebaseAuthRepository.isSignInWithEmailLink(deepLink.toString())) {
          BlocProvider.of<AuthCubit<MyUser>>(context)
              .endSigningWithEmailLink(deepLink);
        } else {
          context
              .read<CurrentTabChangeNotifier>()
              .currentTab
              .tabNavigationService
              .pushRouteForDeepLink(deepLink);
        }
      }
    }, onError: (OnLinkErrorException e) async {
      //TODO Exception
    });

    // TODO i dont know how the rest of bloc works
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  static Future<Uri> createDynamicLink(String pathToPage) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: GeneralConstants.dynamicLinkUrlPrefix,
      link: Uri.parse('https://postraves.com$pathToPage'),
      iosParameters: IosParameters(
        appStoreId: GeneralConstants.iosAppStoreId,
        bundleId: GeneralConstants.iosBundleId,
        fallbackUrl: null, //TODO !!!
      ),
      androidParameters: AndroidParameters(
        packageName: GeneralConstants.androidPackageName,
        //TODO !!!
        fallbackUrl: Uri.parse(
            'https://apps.apple.com/us/app/fitness-lab-bodybuilding/id1301190736'),
      ),
    );
    final ShortDynamicLink shortDynamicLink =
        await dynamicLinkParams.buildShortLink();
    return shortDynamicLink.shortUrl;
  }
}
