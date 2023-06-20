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
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/loading.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/spacers/screen_ending.dart';
import '../../widgets/spacers/section_divider_with_spacers.dart';
import '../state/explore_state_manager.dart';
import '../state/geo_permissions_manager.dart';
import 'widgets/user_card.dart';

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
                  child: Column(
                    children: const [
                      SizedBox(height: 9),
                      SectionDividerWithSpacers(),
                    ],
                  ),
                ),
                //TODO: rewrite to one widget
                SliverToBoxAdapter(
                  child: Container(
                    padding: CEdgeInsets.horizontalStandart.copyWith(
                      bottom: 20,
                    ),
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

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserCard(
                            user: context
                                .read<ExploreStateManager>()
                                .usersWithMostCommonTags[index],
                          ),
                          if (index + 1 !=
                              context
                                  .read<ExploreStateManager>()
                                  .usersWithMostCommonTags
                                  .length)
                            const SizedBox(height: 12),
                        ],
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
    final permissions =
        context.watch<GeoPermissionsManager>().locationPermission;
    final numberOfUsers =
        context.watch<ExploreStateManager>().nearbyUsers.length;
    final failure = context.watch<ExploreStateManager>().failure;
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Container(
            padding: CEdgeInsets.horizontalStandart.copyWith(bottom: 20),
            child: Text(
              'Users nearby',
              style: context.theme.textTheme.titleMedium,
            ),
          ),
        ),
        if (permissions == LocationPermission.denied ||
            permissions == LocationPermission.deniedForever)
          LocationPermissionsNotGranted(locationPermission: permissions)
        else if (numberOfUsers == 0)
          const NearbyUsersNotFoundPlaceholder()
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return UserCard(
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

class NearbyUsersNotFoundPlaceholder extends StatelessWidget {
  const NearbyUsersNotFoundPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    const text =
        'There are no users near you 😢 \nThis is a very new app, we are on a mission to attract people 🫡';
    return const PlaceholderWithTextAndButton(
      text: text,
    );
  }
}

class LocationPermissionsNotGranted extends StatelessWidget {
  final LocationPermission locationPermission;
  const LocationPermissionsNotGranted({
    super.key,
    required this.locationPermission,
  });

  @override
  Widget build(BuildContext context) {
    final text = locationPermission == LocationPermission.deniedForever
        ? "Location permissions are not granted and we can't show you other users nearby 😢\nPlease, go to settings and grant permissions to see great people around 🥰"
        : "Location permissions are not granted and we can't show you other users nearby 😢\nPlease, give us permissions to see great people around 🤗";
    final button = locationPermission == LocationPermission.deniedForever
        ? TextButton(
            onPressed: () async {
              await Geolocator.openAppSettings();
              await context
                  .read<GeoPermissionsManager>()
                  .checkLocationPermissionAndStore();
              context.read<ExploreStateManager>().fetchUsers();
            },
            child: const Text('Open settings'),
          )
        : TextButton(
            onPressed: () async {
              final response = await Geolocator.requestPermission();
              await context
                  .read<GeoPermissionsManager>()
                  .checkLocationPermissionAndStore();
              context.read<ExploreStateManager>().fetchUsers();
            },
            child: const Text('Give permissions'),
          );
    return PlaceholderWithTextAndButton(
      text: text,
      button: button,
    );
  }
}

class PlaceholderWithTextAndButton extends StatelessWidget {
  final Widget? button;
  final String text;
  const PlaceholderWithTextAndButton({
    super.key,
    required this.text,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: CEdgeInsets.horizontalStandart,
      padding: const EdgeInsets.all(15),
      child: button == null
          ? Text(text,                   style: context.theme.textTheme.bodyMedium,
)
          : Column(
              children: [
                Text(
                  text,
                  style: context.theme.textTheme.bodyMedium,
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
