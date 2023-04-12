import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../widgets/loading.dart';
import '../../widgets/snack_bar.dart';
import '../state/explore_state_manager.dart';
import 'widgets/user_tile.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<ExploreStateManager>(),
      builder: (_, __) => const _ExplorePageContent(),
    );
  }
}

class _ExplorePageContent extends StatefulWidget {
  const _ExplorePageContent({super.key});

  @override
  State<_ExplorePageContent> createState() => _ExplorePageContentState();
}

class _ExplorePageContentState extends State<_ExplorePageContent> {
  @override
  void initState() {
    super.initState();
    Provider.of<ExploreStateManager>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ExploreStateManager>(context, listen: true).addListener(
      () {
        final failure = context.read<ExploreStateManager>().failure;
        if (failure != null) {
          final scaffoldMessengerKey =
              context.read<GlobalKey<ScaffoldMessengerState>>();
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    context.spacesRead.unit1,
                  ),
                ),
                backgroundColor: context.theme.snackBarTheme.backgroundColor,
                content: CustomSnackBarContent(
                  failure.forUser,
                ),
                duration: const Duration(milliseconds: 1400),
              ),
            );
        }
      },
    );
    return SafeArea(
      child: CustomScrollView(
        controller: allTabsOrderedAccordingToIndex[0].scrollController,
        slivers: context.watch<ExploreStateManager>().isLoading
            ? [const SliverToBoxAdapter(child: LoadingContainer())]
            : [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: context.spacesRead.unit2,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.spacesWatch.unit3),
                    child: Text('Users nearby'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return UserTile(
                        user: context
                            .read<ExploreStateManager>()
                            .nearbyUsers[index],
                      );
                    },
                    childCount: context
                        .watch<ExploreStateManager>()
                        .nearbyUsers
                        .length, // replace with actual number of nearby users
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.spacesWatch.unit3),
                    child: Text('Users with common interests'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // return widget for each user with common interests
                    },
                    childCount:
                        10, // replace with actual number of users with common interests
                  ),
                ),
                SliverToBoxAdapter(
                    child: PlatformElevatedButton(
                        onPressed: () =>
                            context.router.push(ProfileImagesGridRoute()),
                        child: Text('Sign in'))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: context.spacesRead.unit2,
                  ),
                ),
              ],
      ),
    );
  }
}
