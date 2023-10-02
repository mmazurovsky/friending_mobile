// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i11;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i14;
import 'package:image_picker/image_picker.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i16;
import 'package:uuid/uuid.dart' as _i23;

import '../../screens/events/ds/user_events_ds.dart' as _i33;
import '../../screens/explore/ds/app_events_remote_ds.dart' as _i24;
import '../../screens/explore/ds/coordinates_local_ds.dart' as _i5;
import '../../screens/explore/ds/coordinates_remote_ds.dart' as _i26;
import '../../screens/explore/ds/user_list_ds.dart' as _i34;
import '../../screens/explore/repo/coordinates_repo.dart' as _i27;
import '../../screens/explore/repo/user_list_repo.dart' as _i35;
import '../../screens/explore/state/explore_state_manager.dart' as _i38;
import '../../screens/explore/state/geo_permissions_manager.dart' as _i13;
import '../../screens/other_user/ds/connect_ds.dart' as _i36;
import '../../screens/other_user/ds/other_user_profile_ds.dart' as _i44;
import '../../screens/other_user/ds/pairs_ds.dart' as _i39;
import '../../screens/other_user/repo/connect_repo.dart' as _i37;
import '../../screens/other_user/repo/other_user_profile_repo.dart' as _i45;
import '../../screens/profile/ds/profile_local_ds.dart' as _i19;
import '../../screens/profile/ds/profile_remote_ds.dart' as _i29;
import '../../screens/profile/repo/profile_repo.dart' as _i30;
import '../../screens/profile/state/points_change_notifier.dart' as _i40;
import '../../screens/profile/state/profile_content_manager.dart' as _i41;
import '../../screens/profile/state/profile_editing_manager.dart' as _i42;
import '../../screens/profile/state/profile_images_manager.dart' as _i18;
import '../../screens/profile/state/profile_page_routing_manager.dart' as _i43;
import '../../screens/profile/state/profile_texts_manager.dart' as _i32;
import '../auth/repo/auth_repo.dart' as _i25;
import '../client/request_check_wrapper.dart' as _i20;
import '../configs/auth_changes_listener.dart' as _i31;
import '../image_handling/image_service.dart' as _i28;
import '../navigation/auto_router/app_router.dart' as _i3;
import '../navigation/my_bottom_nav_bar.dart' as _i21;
import '../utils/logger/custom_logger.dart' as _i6;
import '../utils/logger/logger_config.dart' as _i17;
import 'modules.dart' as _i46;

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
  gh.lazySingleton<_i11.FirebaseStorage>(() => modules.firebaseStorage);
  gh.lazySingleton<_i12.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.singleton<_i13.GeoPermissionsManager>(_i13.GeoPermissionsManager());
  gh.lazySingleton<_i14.ImageCropper>(() => modules.imageCropper);
  gh.lazySingleton<_i15.ImagePicker>(() => modules.imagePicker);
  gh.lazySingleton<_i16.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i17.LoggerConfig>(() => _i17.LoggerConfig());
  gh.factory<_i18.ProfileImagesManager>(() => _i18.ProfileImagesManager());
  gh.lazySingleton<_i19.ProfileLocalDS>(() => _i19.ProfileLocalDSImpl());
  gh.lazySingleton<_i20.RequestCheckWrapper>(
      () => _i20.RequestCheckWrapperImpl());
  gh.lazySingleton<_i21.TabsStateManager>(
      () => _i21.TabsStateManager(gh<_i22.TabsRouter>()));
  gh.lazySingleton<_i23.Uuid>(() => modules.uuid);
  gh.lazySingleton<_i24.AppEventsRemoteDS>(() => _i24.AppEventsRemoteDSImpl(
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i25.AuthRepo>(() => _i25.FirebaseAuthRepoImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i26.CoordinatesRemoteDS>(() => _i26.CoordinatesDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i25.AuthRepo>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.singleton<_i27.CoordinatesRepo>(_i27.CoordinatesRepoImpl(
    gh<_i5.CoordinatesLocalDS>(),
    gh<_i26.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i28.ImageService>(() => _i28.FirebaseImageServiceImpl(
        gh<_i11.FirebaseStorage>(),
        gh<_i6.CustomLogger>(),
        gh<_i20.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i29.ProfileRemoteDS>(() => _i29.ProfileDSImpl(
        gh<_i25.AuthRepo>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i30.ProfileRepo>(() => _i30.ProfileRepoImpl(
        gh<_i19.ProfileLocalDS>(),
        gh<_i29.ProfileRemoteDS>(),
      ));
  gh.singleton<_i31.ProfileStreamService>(_i31.ProfileStreamService(
    gh<_i25.AuthRepo>(),
    gh<_i30.ProfileRepo>(),
  ));
  gh.factory<_i32.ProfileTextsAndTagsManager>(
      () => _i32.ProfileTextsAndTagsManager(gh<_i30.ProfileRepo>()));
  gh.lazySingleton<_i33.UserEventsDS>(() => _i33.UserEventsDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i25.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i34.UserListDS>(() => _i34.UserListDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i25.AuthRepo>(),
        gh<_i29.ProfileRemoteDS>(),
        gh<_i20.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i35.UserListRepo>(() => _i35.UserListRepoImpl(
        gh<_i34.UserListDS>(),
        gh<_i27.CoordinatesRepo>(),
        gh<_i30.ProfileRepo>(),
      ));
  gh.singleton<_i31.ActionsToAuthChangesService>(
      _i31.ActionsToAuthChangesService(
    gh<_i25.AuthRepo>(),
    gh<_i30.ProfileRepo>(),
    gh<_i27.CoordinatesRepo>(),
  ));
  gh.lazySingleton<_i36.ConnectDS>(() => _i36.ConnectDSImpl(
        gh<_i34.UserListDS>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i25.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i37.ConnectRepo>(() => _i37.ConnectRepoImpl(
        gh<_i36.ConnectDS>(),
        gh<_i30.ProfileRepo>(),
        gh<_i25.AuthRepo>(),
      ));
  gh.lazySingleton<_i38.ExploreStateManager>(() => _i38.ExploreStateManager(
        gh<_i35.UserListRepo>(),
        gh<_i27.CoordinatesRepo>(),
        gh<_i13.GeoPermissionsManager>(),
      ));
  gh.lazySingleton<_i39.PairsDS>(() => _i39.PairsDSImpl(
        gh<_i34.UserListDS>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i25.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i40.PointsChangeNotifier>(() => _i40.PointsChangeNotifier(
        gh<_i25.AuthRepo>(),
        gh<_i30.ProfileRepo>(),
      ));
  gh.factory<_i41.ProfileContentManager>(() => _i41.ProfileContentManager(
        gh<_i30.ProfileRepo>(),
        gh<_i25.AuthRepo>(),
      ));
  gh.factory<_i42.ProfileEditingManager>(() => _i42.ProfileEditingManager(
        gh<_i18.ProfileImagesManager>(),
        gh<_i32.ProfileTextsAndTagsManager>(),
        gh<_i30.ProfileRepo>(),
        gh<_i25.AuthRepo>(),
      ));
  gh.singleton<_i43.ProfilePageRoutingManager>(
      _i43.ProfilePageRoutingManager(gh<_i31.ProfileStreamService>()));
  gh.lazySingleton<_i44.OtherUserProfileDS>(() => _i44.OtherUserProfileDSImpl(
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i25.AuthRepo>(),
        gh<_i6.CustomLogger>(),
        gh<_i39.PairsDS>(),
      ));
  gh.lazySingleton<_i45.OtherUserProfileRepo>(
      () => _i45.OtherUserProfileRepoImpl(gh<_i44.OtherUserProfileDS>()));
  return getIt;
}

class _$Modules extends _i46.Modules {}
