// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:firebase_messaging/firebase_messaging.dart' as _i11;
import 'package:firebase_storage/firebase_storage.dart' as _i12;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i15;
import 'package:image_picker/image_picker.dart' as _i16;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i17;
import 'package:uuid/uuid.dart' as _i24;

import '../../screens/current_pair/ds/pair_ds.dart' as _i31;
import '../../screens/events/ds/user_events_ds.dart' as _i37;
import '../../screens/explore/ds/app_events_remote_ds.dart' as _i25;
import '../../screens/explore/ds/coordinates_local_ds.dart' as _i5;
import '../../screens/explore/ds/coordinates_remote_ds.dart' as _i27;
import '../../screens/explore/ds/user_list_ds.dart' as _i38;
import '../../screens/explore/repo/coordinates_repo.dart' as _i28;
import '../../screens/explore/repo/user_list_repo.dart' as _i39;
import '../../screens/explore/state/explore_state_manager.dart' as _i43;
import '../../screens/explore/state/geo_permissions_manager.dart' as _i14;
import '../../screens/other_user/ds/connect_ds.dart' as _i41;
import '../../screens/other_user/ds/other_user_profile_ds.dart' as _i44;
import '../../screens/other_user/repo/connect_repo.dart' as _i42;
import '../../screens/other_user/repo/other_user_profile_repo.dart' as _i45;
import '../../screens/profile/ds/profile_local_ds.dart' as _i20;
import '../../screens/profile/ds/profile_remote_ds.dart' as _i32;
import '../../screens/profile/repo/profile_repo.dart' as _i33;
import '../../screens/profile/state/points_change_notifier.dart' as _i46;
import '../../screens/profile/state/profile_content_manager.dart' as _i47;
import '../../screens/profile/state/profile_editing_manager.dart' as _i48;
import '../../screens/profile/state/profile_images_manager.dart' as _i19;
import '../../screens/profile/state/profile_page_routing_manager.dart' as _i49;
import '../../screens/profile/state/profile_texts_manager.dart' as _i35;
import '../../screens/profile/state/short_profile_change_notifier.dart' as _i36;
import '../auth_and_profile/auth_changes_listener.dart' as _i40;
import '../auth_and_profile/auth_repo.dart' as _i26;
import '../auth_and_profile/profile_stream_service.dart' as _i34;
import '../client/request_check_wrapper.dart' as _i21;
import '../configs/fcm_token_manager.dart' as _i29;
import '../image_handling/image_service.dart' as _i30;
import '../navigation/auto_router/app_router.dart' as _i3;
import '../navigation/my_bottom_nav_bar.dart' as _i22;
import '../utils/logger/custom_logger.dart' as _i6;
import '../utils/logger/logger_config.dart' as _i18;
import 'modules.dart' as _i50;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final modules = _$Modules();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.Connectivity>(() => modules.connectivity);
  gh.lazySingleton<_i5.CoordinatesLocalDS>(() => _i5.CoordinatesLocalDSImpl());
  gh.lazySingleton<_i6.CustomLogger>(() => _i6.LoggerImpl());
  gh.lazySingleton<_i7.FirebaseAnalytics>(() => modules.firebaseAnalytics);
  gh.lazySingleton<_i8.FirebaseAuth>(() => modules.firebaseAuth);
  gh.lazySingleton<_i9.FirebaseCrashlytics>(() => modules.firebaseCrashlytics);
  gh.lazySingleton<_i10.FirebaseFirestore>(() => modules.firebaseFirestore);
  gh.lazySingleton<_i11.FirebaseMessaging>(() => modules.firebaseMessaging);
  gh.lazySingleton<_i12.FirebaseStorage>(() => modules.firebaseStorage);
  gh.lazySingleton<_i13.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.singleton<_i14.GeoPermissionsManager>(_i14.GeoPermissionsManager());
  gh.lazySingleton<_i15.ImageCropper>(() => modules.imageCropper);
  gh.lazySingleton<_i16.ImagePicker>(() => modules.imagePicker);
  gh.lazySingleton<_i17.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i18.LoggerConfig>(() => _i18.LoggerConfig());
  gh.factory<_i19.ProfileImagesManager>(() => _i19.ProfileImagesManager());
  gh.lazySingleton<_i20.ProfileLocalDS>(() => _i20.ProfileLocalDSImpl());
  gh.lazySingleton<_i21.RequestCheckWrapper>(
      () => _i21.RequestCheckWrapperImpl());
  gh.lazySingleton<_i22.TabsStateManager>(
      () => _i22.TabsStateManager(gh<_i23.TabsRouter>()));
  gh.lazySingleton<_i24.Uuid>(() => modules.uuid);
  gh.lazySingleton<_i25.AppEventsRemoteDS>(() => _i25.AppEventsRemoteDSImpl(
        gh<_i21.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i26.AuthRepo>(() => _i26.FirebaseAuthRepoImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i27.CoordinatesRemoteDS>(() => _i27.CoordinatesDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i13.GeoFlutterFire>(),
        gh<_i26.AuthRepo>(),
        gh<_i21.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.singleton<_i28.CoordinatesRepo>(_i28.CoordinatesRepoImpl(
    gh<_i5.CoordinatesLocalDS>(),
    gh<_i27.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i29.FcmTokenManagementDS>(
      () => _i29.FcmTokenManagementDSImpl(
            gh<_i10.FirebaseFirestore>(),
            gh<_i21.RequestCheckWrapper>(),
          ));
  gh.lazySingleton<_i29.FcmTokenManagementRepo>(
      () => _i29.FcmTokenManagementRepoImpl(
            gh<_i26.AuthRepo>(),
            gh<_i11.FirebaseMessaging>(),
            gh<_i29.FcmTokenManagementDS>(),
          ));
  gh.lazySingleton<_i30.ImageService>(() => _i30.FirebaseImageServiceImpl(
        gh<_i12.FirebaseStorage>(),
        gh<_i6.CustomLogger>(),
        gh<_i21.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i31.PairDS>(() => _i31.PairDSImpl(
        gh<_i21.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i26.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i32.ProfileRemoteDS>(() => _i32.ProfileDSImpl(
        gh<_i26.AuthRepo>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i21.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
        gh<_i31.PairDS>(),
      ));
  gh.lazySingleton<_i33.ProfileRepo>(() => _i33.ProfileRepoImpl(
        gh<_i20.ProfileLocalDS>(),
        gh<_i32.ProfileRemoteDS>(),
        gh<_i26.AuthRepo>(),
      ));
  gh.singleton<_i34.ProfileStreamService>(_i34.ProfileStreamService(
    gh<_i26.AuthRepo>(),
    gh<_i33.ProfileRepo>(),
  ));
  gh.factory<_i35.ProfileTextsAndTagsManager>(
      () => _i35.ProfileTextsAndTagsManager(gh<_i33.ProfileRepo>()));
  gh.lazySingleton<_i36.ShortProfileChangeNotifier>(
      () => _i36.ShortProfileChangeNotifier(gh<_i34.ProfileStreamService>()));
  gh.lazySingleton<_i37.UserEventsDS>(() => _i37.UserEventsDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i21.RequestCheckWrapper>(),
        gh<_i26.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i38.UserListDS>(() => _i38.UserListDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i13.GeoFlutterFire>(),
        gh<_i26.AuthRepo>(),
        gh<_i32.ProfileRemoteDS>(),
        gh<_i21.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i39.UserListRepo>(() => _i39.UserListRepoImpl(
        gh<_i38.UserListDS>(),
        gh<_i28.CoordinatesRepo>(),
        gh<_i33.ProfileRepo>(),
      ));
  gh.singleton<_i40.ActionsToAuthChangesService>(
      _i40.ActionsToAuthChangesService(
    gh<_i26.AuthRepo>(),
    gh<_i33.ProfileRepo>(),
    gh<_i28.CoordinatesRepo>(),
  ));
  gh.lazySingleton<_i41.ConnectDS>(() => _i41.ConnectDSImpl(
        gh<_i38.UserListDS>(),
        gh<_i21.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i26.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i42.ConnectRepo>(() => _i42.ConnectRepoImpl(
        gh<_i41.ConnectDS>(),
        gh<_i33.ProfileRepo>(),
        gh<_i26.AuthRepo>(),
      ));
  gh.lazySingleton<_i43.ExploreStateManager>(() => _i43.ExploreStateManager(
        gh<_i39.UserListRepo>(),
        gh<_i28.CoordinatesRepo>(),
        gh<_i14.GeoPermissionsManager>(),
      ));
  gh.lazySingleton<_i44.OtherUserProfileDS>(() => _i44.OtherUserProfileDSImpl(
        gh<_i21.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i26.AuthRepo>(),
        gh<_i6.CustomLogger>(),
        gh<_i31.PairDS>(),
      ));
  gh.lazySingleton<_i45.OtherUserProfileRepo>(
      () => _i45.OtherUserProfileRepoImpl(gh<_i44.OtherUserProfileDS>()));
  gh.lazySingleton<_i46.PointsChangeNotifier>(() => _i46.PointsChangeNotifier(
        gh<_i26.AuthRepo>(),
        gh<_i33.ProfileRepo>(),
      ));
  gh.factory<_i47.ProfileContentManager>(() => _i47.ProfileContentManager(
        gh<_i33.ProfileRepo>(),
        gh<_i26.AuthRepo>(),
      ));
  gh.factory<_i48.ProfileEditingManager>(() => _i48.ProfileEditingManager(
        gh<_i19.ProfileImagesManager>(),
        gh<_i35.ProfileTextsAndTagsManager>(),
        gh<_i33.ProfileRepo>(),
        gh<_i26.AuthRepo>(),
      ));
  gh.singleton<_i49.ProfilePageRoutingManager>(
      _i49.ProfilePageRoutingManager(gh<_i34.ProfileStreamService>()));
  return getIt;
}

class _$Modules extends _i50.Modules {}
