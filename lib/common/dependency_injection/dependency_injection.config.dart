// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i11;
import 'package:firebase_storage/firebase_storage.dart' as _i13;
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart' as _i28;
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i24;
import 'package:flutter_mobile_starter/common/configs/auth_changes_listener.dart'
    as _i38;
import 'package:flutter_mobile_starter/common/data/enums.dart' as _i5;
import 'package:flutter_mobile_starter/common/data/models/user_models.dart'
    as _i21;
import 'package:flutter_mobile_starter/common/image_handling/image_service.dart'
    as _i31;
import 'package:flutter_mobile_starter/common/navigation/auto_router/app_router.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/navigation/my_bottom_nav_bar.dart'
    as _i25;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i8;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i19;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_local_ds.dart'
    as _i7;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_remote_ds.dart'
    as _i29;
import 'package:flutter_mobile_starter/screens/explore/ds/user_list_ds.dart'
    as _i36;
import 'package:flutter_mobile_starter/screens/explore/repo/coordinates_repo.dart'
    as _i30;
import 'package:flutter_mobile_starter/screens/explore/repo/user_list_repo.dart'
    as _i37;
import 'package:flutter_mobile_starter/screens/explore/state/explore_state_manager.dart'
    as _i40;
import 'package:flutter_mobile_starter/screens/explore/state/geo_permissions_manager.dart'
    as _i15;
import 'package:flutter_mobile_starter/screens/other_user/ds/connect_ds.dart'
    as _i39;
import 'package:flutter_mobile_starter/screens/other_user/ds/other_user_profile_ds.dart'
    as _i43;
import 'package:flutter_mobile_starter/screens/other_user/ds/pairs_ds.dart'
    as _i41;
import 'package:flutter_mobile_starter/screens/other_user/state/connect_manager.dart'
    as _i4;
import 'package:flutter_mobile_starter/screens/other_user/state/other_user_manager.dart'
    as _i20;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_local_ds.dart'
    as _i23;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_remote_ds.dart'
    as _i32;
import 'package:flutter_mobile_starter/screens/profile/ds/souls_ds.dart'
    as _i35;
import 'package:flutter_mobile_starter/screens/profile/repo/profile_repo.dart'
    as _i33;
import 'package:flutter_mobile_starter/screens/profile/state/profile_content_manager.dart'
    as _i42;
import 'package:flutter_mobile_starter/screens/profile/state/profile_images_manager.dart'
    as _i22;
import 'package:flutter_mobile_starter/screens/profile/state/profile_texts_manager.dart'
    as _i34;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i16;
import 'package:image_picker/image_picker.dart' as _i17;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i18;
import 'package:uuid/uuid.dart' as _i27;

import 'modules.dart' as _i44;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
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
  gh.factory<_i4.ConnectStateManager>(
      () => _i4.ConnectStateManager(gh<_i5.UserPairStatusEnum>()));
  gh.lazySingleton<_i6.Connectivity>(() => modules.connectivity);
  gh.lazySingleton<_i7.CoordinatesLocalDS>(() => _i7.CoordinatesLocalDSImpl());
  gh.lazySingleton<_i8.CustomLogger>(() => _i8.LoggerImpl());
  gh.lazySingleton<_i9.FirebaseAnalytics>(() => modules.firebaseAnalytics);
  gh.lazySingleton<_i10.FirebaseAuth>(() => modules.firebaseAuth);
  gh.lazySingleton<_i11.FirebaseCrashlytics>(() => modules.firebaseCrashlytics);
  gh.lazySingleton<_i12.FirebaseFirestore>(() => modules.firebaseFirestore);
  gh.lazySingleton<_i13.FirebaseStorage>(() => modules.firebaseStorage);
  gh.lazySingleton<_i14.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.singleton<_i15.GeoPermissionsManager>(_i15.GeoPermissionsManager());
  gh.lazySingleton<_i16.ImageCropper>(() => modules.imageCropper);
  gh.lazySingleton<_i17.ImagePicker>(() => modules.imagePicker);
  gh.lazySingleton<_i18.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i19.LoggerConfig>(() => _i19.LoggerConfig());
  gh.factory<_i20.OtherUserManager>(
      () => _i20.OtherUserManager(gh<_i21.ShortReadUserModel>()));
  gh.factory<_i22.ProfileImagesManager>(() => _i22.ProfileImagesManager());
  gh.lazySingleton<_i23.ProfileLocalDS>(() => _i23.ProfileLocalDSImpl());
  gh.lazySingleton<_i24.RequestCheckWrapper>(
      () => _i24.RequestCheckWrapperImpl());
  gh.factory<_i25.TabsStateManager>(
      () => _i25.TabsStateManager(gh<_i26.TabsRouter>()));
  gh.lazySingleton<_i27.Uuid>(() => modules.uuid);
  gh.lazySingleton<_i28.AuthRepo>(() => _i28.FirebaseAuthRepoImpl(
        gh<_i10.FirebaseAuth>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i29.CoordinatesRemoteDS>(() => _i29.CoordinatesDSImpl(
        gh<_i12.FirebaseFirestore>(),
        gh<_i14.GeoFlutterFire>(),
        gh<_i28.AuthRepo>(),
        gh<_i24.RequestCheckWrapper>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.singleton<_i30.CoordinatesRepo>(_i30.CoordinatesRepoImpl(
    gh<_i7.CoordinatesLocalDS>(),
    gh<_i29.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i31.ImageService>(() => _i31.FirebaseImageServiceImpl(
        gh<_i13.FirebaseStorage>(),
        gh<_i8.CustomLogger>(),
        gh<_i24.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i32.ProfileRemoteDS>(() => _i32.ProfileDSImpl(
        gh<_i28.AuthRepo>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i24.RequestCheckWrapper>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i33.ProfileRepo>(() => _i33.ProfileRepoImpl(
        gh<_i23.ProfileLocalDS>(),
        gh<_i32.ProfileRemoteDS>(),
      ));
  gh.factory<_i34.ProfileTextsAndTagsManager>(
      () => _i34.ProfileTextsAndTagsManager(gh<_i33.ProfileRepo>()));
  gh.lazySingleton<_i35.SoulsDS>(() => _i35.SoulsDSImpl(
        gh<_i24.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i28.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i36.UserListDS>(() => _i36.UserListDSImpl(
        gh<_i12.FirebaseFirestore>(),
        gh<_i14.GeoFlutterFire>(),
        gh<_i28.AuthRepo>(),
        gh<_i32.ProfileRemoteDS>(),
        gh<_i24.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i37.UserListRepo>(() => _i37.UserListRepoImpl(
        gh<_i36.UserListDS>(),
        gh<_i30.CoordinatesRepo>(),
        gh<_i33.ProfileRepo>(),
      ));
  gh.lazySingleton<_i38.AuthChangesListener>(() => _i38.AuthChangesListenerImpl(
        gh<_i28.AuthRepo>(),
        gh<_i33.ProfileRepo>(),
        gh<_i30.CoordinatesRepo>(),
      ));
  gh.lazySingleton<_i39.ConnectDS>(() => _i39.ConnectDSImpl(
        gh<_i36.UserListDS>(),
        gh<_i24.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i28.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i40.ExploreStateManager>(() => _i40.ExploreStateManager(
        gh<_i37.UserListRepo>(),
        gh<_i30.CoordinatesRepo>(),
        gh<_i15.GeoPermissionsManager>(),
      ));
  gh.lazySingleton<_i41.PairsDS>(() => _i41.PairsDSImpl(
        gh<_i36.UserListDS>(),
        gh<_i24.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i28.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i42.ProfileContentManager>(
      () => _i42.ProfileContentManager(gh<_i33.ProfileRepo>()));
  gh.lazySingleton<_i43.OtherUserProfileDS>(() => _i43.OtherUserProfileDSImpl(
        gh<_i24.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i28.AuthRepo>(),
        gh<_i8.CustomLogger>(),
        gh<_i41.PairsDS>(),
      ));
  return getIt;
}

class _$Modules extends _i44.Modules {}
