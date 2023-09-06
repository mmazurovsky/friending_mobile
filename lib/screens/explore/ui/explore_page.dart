import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../common/bag/spaces.dart';
import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../../common/widgets/app_bar/custom_sliver_app_bar.dart';
import '../../../common/widgets/custom_edge_insets.dart';
import '../../../common/widgets/loading.dart';
import '../../../common/widgets/snack_bar.dart';
import '../../../common/widgets/spacers/screen_ending.dart';
import '../../../common/widgets/texts/custom_header.dart';
import '../state/explore_state_manager.dart';
import '../state/geo_permissions_manager.dart';
import 'widgets/user_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<ExploreStateManager>()..fetchUsers(),
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
    _scrollController = allTabsOrderedAccordingToIndex[0].scrollController;
    Provider.of<ExploreStateManager>(context, listen: false).addListener(
      () {
        final failure = context.read<ExploreStateManager>().failure;
        if (failure != null) {
          final scaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();
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
  }

  // List<Widget> getLoaded() {
  //   return [
  //     SliverToBoxAdapter(
  //       child: SizedBox(
  //         height: ConstSpaces.unit4,
  //       ),
  //     ),
  //     // ...getUsersNearbySection(),
  //     // SliverToBoxAdapter(
  //     //   child: SizedBox(height: ConstSpaces.unit8),
  //     // ),
  //     ...getMostRelevantUsersSection(),
  //     SliverToBoxAdapter(
  //       child:
  //           // Container(height: 1000,color: Colors.amber)
  //           ScreenEnding(),
  //     ),
  //   ];
  // }

  // List<Widget> getUsersNearbySection() {
  //   const widgetToShow = SliverToBoxAdapter(child: NearbyUsersNotFoundPlaceholder());
  //   return [
  //     const SliverToBoxAdapter(
  //       child: CustomScreenHeader(text: 'Users nearby'),
  //     ),
  //     widgetToShow,
  //   ];
  // }

  // List<Widget> getMostRelevantUsersSection() {
  //   final count = context.read<ExploreStateManager>().usersWithMostCommonTags.length;
  //   return [
  //     const SliverToBoxAdapter(
  //       child: CustomScreenHeader(text: 'Most relevant'),
  //     ),
  //     SliverGrid(
  //       delegate: SliverChildBuilderDelegate(
  //         (BuildContext context, int index) {
  //           return UserCard(
  //             user: context.read<ExploreStateManager>().usersWithMostCommonTags[index],
  //           );
  //         },
  //         childCount: count,
  //       ),
  //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //         maxCrossAxisExtent: 300,
  //         childAspectRatio: 0.66,
  //         crossAxisSpacing: 12,
  //         mainAxisSpacing: 30,
  //       ),
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        //   child:
        // SmartRefresher(
        //   enablePullDown: true,
        //   controller: context.read<ExploreStateManager>().refreshController,
        //   onRefresh: context.read<ExploreStateManager>().refreshUsers,
        //   child:
        CustomScrollView(
      controller: _scrollController,
      slivers: [
        CustomSliverAppBar(
          isBackButtonOn: false,
          titleWidget: Text('Locked club', style: context.styles.genericHeader),
        ),
        if (context.watch<ExploreStateManager>().isLoading)
          const SliverToBoxAdapter(
            child: LoadingContainer(),
          )
        else
          const LoadedBody(),
      ],
    // ),
    );
  }
}

class LoadedBody extends StatelessWidget {
  const LoadedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: ConstSpaces.unit4,
          ),
        ),
        UsersNearbySection(),
        SliverToBoxAdapter(
          child: SizedBox(height: ConstSpaces.unit8),
        ),
        MostRelevantUsersSection(),
        SliverToBoxAdapter(
          child: ScreenEnding(),
        ),
      ],
    );
  }
}

class MostRelevantUsersSection extends StatelessWidget {
  const MostRelevantUsersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: [
      // const SliverToBoxAdapter(
      //   child: CustomScreenHeader(
      //     text: 'Most relevant',
      //   ),
      // ),
      SliverPadding(
        padding: const EdgeInsets.only(
          right: 8.0,
          left: 8,
          bottom: 30,
        ),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return UserCard(
              user: context.read<ExploreStateManager>().usersWithMostCommonTags[index],
            );
          }, childCount: context.read<ExploreStateManager>().usersWithMostCommonTags.length, addAutomaticKeepAlives: true),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.66,
            crossAxisSpacing: 12,
            mainAxisSpacing: 30,
          ),
        ),
      ),
    ]);
  }
}

class UsersNearbySection extends StatelessWidget {
  const UsersNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    // final permissions = context.watch<GeoPermissionsManager>().locationPermission;
    // final numberOfUsers = context.watch<ExploreStateManager>().nearbyUsers.length;
    // final failure = context.watch<ExploreStateManager>().failure;
    final widget = const SliverToBoxAdapter(child: NearbyUsersNotFoundPlaceholder());

    // (permissions == LocationPermission.denied || permissions == LocationPermission.deniedForever)
    //     ? SliverToBoxAdapter(child: LocationPermissionsNotGranted(locationPermission: permissions))
    //     : (numberOfUsers == 0)
    //         ? const SliverToBoxAdapter(child: NearbyUsersNotFoundPlaceholder())
    //         : SliverList(
    //             delegate: SliverChildBuilderDelegate(
    //               (BuildContext context, int index) {
    //                 return UserCard(
    //                   user: context.read<ExploreStateManager>().nearbyUsers[index],
    //                 );
    //               },
    //               childCount: context.watch<ExploreStateManager>().nearbyUsers.length,
    //             ),
    //           );

    // return
    // SliverList(
    //   delegate: SliverChildListDelegate(
    //     [
    //       CustomScreenHeader(text: 'Users nearby'),
    //       NearbyUsersNotFoundPlaceholder(),
    //     ],
    //   ),
    // );
    return MultiSliver(
      children: [
        const SliverToBoxAdapter(
          child: CustomScreenHeader(text: 'Users nearby'),
        ),
        widget,
      ],
    );
  }
}

class NearbyUsersNotFoundPlaceholder extends StatelessWidget {
  const NearbyUsersNotFoundPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    const text = 'There are no users near you atm 😢 \nThis is a very new app, give us some time 😌';
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
              await context.read<GeoPermissionsManager>().checkLocationPermissionAndStore();
              context.read<ExploreStateManager>().fetchUsers();
            },
            child: const Text('Open settings'),
          )
        : TextButton(
            onPressed: () async {
              final response = await Geolocator.requestPermission();
              await context.read<GeoPermissionsManager>().checkLocationPermissionAndStore();
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
        color: context.colors.containerColor,
        borderRadius: BorderRadius.circular(ConstRadiuses.card),
        // border: Border.all(
        //   color: context.colors.border,
        //   width: 2,
        // ),
      ),
      margin: CEdgeInsets.horizontalStandart,
      padding: const EdgeInsets.all(15),
      child: button == null
          ? Text(
              text,
              style: context.styles.bodyText,
            )
          : Column(
              children: [
                Text(
                  text,
                  style: context.styles.bodyText,
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
