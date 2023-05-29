import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../../common/service/open_link_service.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/loading.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/spacers/screen_ending.dart';
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
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    Provider.of<ExploreStateManager>(context, listen: false).fetchUsers();
    _scrollController = allTabsOrderedAccordingToIndex[0].scrollController;
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
            ..showCSnackBar(
              CustomSnackBarContent(
                failure.forUser,
              ),
            );
        }
      },
    );
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: context.watch<ExploreStateManager>().isLoading
            ? [
                const SliverToBoxAdapter(
                  child: LoadingContainer(),
                ),
              ]
            : [
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: Spaces.unit2,
                  ),
                ),
                const UsersNearbySection(),
                SliverToBoxAdapter(
                  child: Container(
                    padding: CEdgeInsets.horizontalStandart,
                    child: Text(
                      'Most relevant',
                      style: context.theme.textTheme.titleMedium,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // return widget for each user with common interests
                      return UserTile(
                        user: context
                            .read<ExploreStateManager>()
                            .usersWithMostCommonTags[index],
                      );
                    },
                    childCount: context
                        .read<ExploreStateManager>()
                        .usersWithMostCommonTags
                        .length, // replace with actual number of users with common interests
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: CEdgeInsets.horizontalStandart,
                    child: PlatformElevatedButton(
                      onPressed: () => context.router.push(
                        const ProfileEditingRoute(),
                      ),
                      child: const Text(
                        'Sign in',
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ScreenEnding(),
                ),
              ],
      ),
    );
  }
}

class UsersNearbySection extends StatelessWidget {
  const UsersNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    final numberOfUsers =
        context.watch<ExploreStateManager>().nearbyUsers.length;
    final failure = context.watch<ExploreStateManager>().failure;
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Container(
            padding: CEdgeInsets.horizontalStandart,
            child: Text(
              'Users nearby',
              style: context.theme.textTheme.titleMedium,
            ),
          ),
        ),
        if (numberOfUsers == 0 || failure != null)
          const NearbyUsersNotFoundPlacoholder()
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return UserTile(
                  user: context.read<ExploreStateManager>().nearbyUsers[index],
                );
              },
              childCount:
                  context.watch<ExploreStateManager>().nearbyUsers.length,
            ),
          ),
      ],
    );
  }
}

class NearbyUsersNotFoundPlacoholder extends StatelessWidget {
  const NearbyUsersNotFoundPlacoholder({super.key});

  @override
  Widget build(BuildContext context) {
    final failure = context.watch<ExploreStateManager>().failure;
    final usersNearbyCount =
        context.watch<ExploreStateManager>().nearbyUsers.length;
    final text = failure != null
        ? failure.forUser
        : usersNearbyCount == 0
            ? 'There are no users near you 😢 \nWe are a very new app, give us time to attract more users 🫡'
            : 'Something went wrong, contact support';
    final button = failure != null
        ? TextButton(
            onPressed: () => Geolocator.openAppSettings(),
            child: const Text('Open app settings'),
          )
        : usersNearbyCount == 0
            ? null
            : TextButton(
                onPressed: () => OpenLinkService.openTelegram('jkjkjkjkjjkjkk'),
                child: const Text('Contact support'),
              );
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: CEdgeInsets.horizontalStandart.copyWith(
        top: 15,
        bottom: 15,
      ),
      padding: const EdgeInsets.all(15),
      child: button == null
          ? Text(text)
          : Column(
              children: [
                Text(
                  text,
                  style: context.theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: button,
                ),
              ],
            ),
    );
  }
}
