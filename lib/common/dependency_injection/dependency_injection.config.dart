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

import '../../screens/explore/ds/coordinates_local_ds.dart' as _i5;
import '../../screens/explore/ds/coordinates_remote_ds.dart' as _i25;
import '../../screens/explore/ds/user_list_ds.dart' as _i33;
import '../../screens/explore/repo/coordinates_repo.dart' as _i26;
import '../../screens/explore/repo/user_list_repo.dart' as _i34;
import '../../screens/explore/state/explore_state_manager.dart' as _i37;
import '../../screens/explore/state/geo_permissions_manager.dart' as _i13;
import '../../screens/other_user/ds/connect_ds.dart' as _i35;
import '../../screens/other_user/ds/other_user_profile_ds.dart' as _i43;
import '../../screens/other_user/ds/pairs_ds.dart' as _i38;
import '../../screens/other_user/repo/connect_repo.dart' as _i36;
import '../../screens/other_user/repo/other_user_profile_repo.dart' as _i44;
import '../../screens/profile/ds/profile_local_ds.dart' as _i19;
import '../../screens/profile/ds/profile_remote_ds.dart' as _i28;
import '../../screens/profile/ds/souls_ds.dart' as _i32;
import '../../screens/profile/repo/profile_repo.dart' as _i29;
import '../../screens/profile/state/points_change_notifier.dart' as _i39;
import '../../screens/profile/state/profile_content_manager.dart' as _i40;
import '../../screens/profile/state/profile_editing_manager.dart' as _i41;
import '../../screens/profile/state/profile_images_manager.dart' as _i18;
import '../../screens/profile/state/profile_page_routing_manager.dart' as _i42;
import '../../screens/profile/state/profile_texts_manager.dart' as _i31;
import '../auth/repo/auth_repo.dart' as _i24;
import '../client/request_check_wrapper.dart' as _i20;
import '../configs/auth_changes_listener.dart' as _i30;
import '../image_handling/image_service.dart' as _i27;
import '../navigation/auto_router/app_router.dart' as _i3;
import '../navigation/my_bottom_nav_bar.dart' as _i21;
import '../utils/logger/custom_logger.dart' as _i6;
import '../utils/logger/logger_config.dart' as _i17;
import 'modules.dart' as _i45;

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
  gh.lazySingleton<_i24.AuthRepo>(() => _i24.FirebaseAuthRepoImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i25.CoordinatesRemoteDS>(() => _i25.CoordinatesDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i24.AuthRepo>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.singleton<_i26.CoordinatesRepo>(_i26.CoordinatesRepoImpl(
    gh<_i5.CoordinatesLocalDS>(),
    gh<_i25.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i27.ImageService>(() => _i27.FirebaseImageServiceImpl(
        gh<_i11.FirebaseStorage>(),
        gh<_i6.CustomLogger>(),
        gh<_i20.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i28.ProfileRemoteDS>(() => _i28.ProfileDSImpl(
        gh<_i24.AuthRepo>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i29.ProfileRepo>(() => _i29.ProfileRepoImpl(
        gh<_i19.ProfileLocalDS>(),
        gh<_i28.ProfileRemoteDS>(),
      ));
  gh.singleton<_i30.ProfileStreamService>(_i30.ProfileStreamService(
    gh<_i24.AuthRepo>(),
    gh<_i29.ProfileRepo>(),
  ));
  gh.factory<_i31.ProfileTextsAndTagsManager>(
      () => _i31.ProfileTextsAndTagsManager(gh<_i29.ProfileRepo>()));
  gh.lazySingleton<_i32.SoulsDS>(() => _i32.SoulsDSImpl(
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i24.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i33.UserListDS>(() => _i33.UserListDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i24.AuthRepo>(),
        gh<_i28.ProfileRemoteDS>(),
        gh<_i20.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i34.UserListRepo>(() => _i34.UserListRepoImpl(
        gh<_i33.UserListDS>(),
        gh<_i26.CoordinatesRepo>(),
        gh<_i29.ProfileRepo>(),
      ));
  gh.singleton<_i30.ActionsToAuthChangesService>(
      _i30.ActionsToAuthChangesService(
    gh<_i24.AuthRepo>(),
    gh<_i29.ProfileRepo>(),
    gh<_i26.CoordinatesRepo>(),
  ));
  gh.lazySingleton<_i35.ConnectDS>(() => _i35.ConnectDSImpl(
        gh<_i33.UserListDS>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i24.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i36.ConnectRepo>(() => _i36.ConnectRepoImpl(
        gh<_i35.ConnectDS>(),
        gh<_i29.ProfileRepo>(),
        gh<_i24.AuthRepo>(),
      ));
  gh.lazySingleton<_i37.ExploreStateManager>(() => _i37.ExploreStateManager(
        gh<_i34.UserListRepo>(),
        gh<_i26.CoordinatesRepo>(),
        gh<_i13.GeoPermissionsManager>(),
      ));
  gh.lazySingleton<_i38.PairsDS>(() => _i38.PairsDSImpl(
        gh<_i33.UserListDS>(),
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i24.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i39.PointsChangeNotifier>(() => _i39.PointsChangeNotifier(
        gh<_i24.AuthRepo>(),
        gh<_i29.ProfileRepo>(),
      ));
  gh.factory<_i40.ProfileContentManager>(() => _i40.ProfileContentManager(
        gh<_i29.ProfileRepo>(),
        gh<_i24.AuthRepo>(),
      ));
  gh.factory<_i41.ProfileEditingManager>(() => _i41.ProfileEditingManager(
        gh<_i18.ProfileImagesManager>(),
        gh<_i31.ProfileTextsAndTagsManager>(),
        gh<_i29.ProfileRepo>(),
        gh<_i24.AuthRepo>(),
      ));
  gh.singleton<_i42.ProfilePageRoutingManager>(
      _i42.ProfilePageRoutingManager(gh<_i30.ProfileStreamService>()));
  gh.lazySingleton<_i43.OtherUserProfileDS>(() => _i43.OtherUserProfileDSImpl(
        gh<_i20.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i24.AuthRepo>(),
        gh<_i6.CustomLogger>(),
        gh<_i38.PairsDS>(),
      ));
  gh.lazySingleton<_i44.OtherUserProfileRepo>(
      () => _i44.OtherUserProfileRepoImpl(gh<_i43.OtherUserProfileDS>()));
  return getIt;
}

class _$Modules extends _i45.Modules {}
