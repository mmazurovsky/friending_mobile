// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart' as _i21;
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i18;
import 'package:flutter_mobile_starter/common/configs/auth_changes_listener.dart'
    as _i31;
import 'package:flutter_mobile_starter/common/navigation/auto_router/app_router.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/navigation/my_bottom_nav_bar.dart'
    as _i19;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i6;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i15;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_local_ds.dart'
    as _i5;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_remote_ds.dart'
    as _i23;
import 'package:flutter_mobile_starter/screens/explore/ds/user_list_ds.dart'
    as _i29;
import 'package:flutter_mobile_starter/screens/explore/repo/coordinates_repo.dart'
    as _i24;
import 'package:flutter_mobile_starter/screens/explore/repo/user_list_repo.dart'
    as _i30;
import 'package:flutter_mobile_starter/screens/explore/state/explore_state_manager.dart'
    as _i32;
import 'package:flutter_mobile_starter/screens/other_user/ds/connect_ds.dart'
    as _i22;
import 'package:flutter_mobile_starter/screens/other_user/ds/other_user_profile_ds.dart'
    as _i25;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_local_ds.dart'
    as _i17;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_remote_ds.dart'
    as _i26;
import 'package:flutter_mobile_starter/screens/profile/ds/souls_ds.dart'
    as _i28;
import 'package:flutter_mobile_starter/screens/profile/repo/profile_repo.dart'
    as _i27;
import 'package:flutter_mobile_starter/screens/profile/state/profile_images_manager.dart'
    as _i16;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i12;
import 'package:image_picker/image_picker.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;

import 'modules.dart' as _i33;

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
  gh.lazySingleton<_i4.Connectivity>(() => modules.connectivity);
  gh.lazySingleton<_i5.CoordinatesLocalDS>(() => _i5.CoordinatesLocalDSImpl());
  gh.lazySingleton<_i6.CustomLogger>(() => _i6.LoggerImpl());
  gh.lazySingleton<_i7.FirebaseAnalytics>(() => modules.firebaseAnalytics);
  gh.lazySingleton<_i8.FirebaseAuth>(() => modules.firebaseAuth);
  gh.lazySingleton<_i9.FirebaseCrashlytics>(() => modules.firebaseCrashlytics);
  gh.lazySingleton<_i10.FirebaseFirestore>(() => modules.firebaseFirestore);
  gh.lazySingleton<_i11.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.lazySingleton<_i12.ImageCropper>(() => modules.imageCropper);
  gh.lazySingleton<_i13.ImagePicker>(() => modules.imagePicker);
  gh.lazySingleton<_i14.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i15.LoggerConfig>(() => _i15.LoggerConfig());
  gh.lazySingleton<_i16.ProfileImagesManager>(() => _i16.ProfileImagesManager(
        gh<int>(),
        gh<_i16.ProfileImageData>(),
      ));
  gh.lazySingleton<_i17.ProfileLocalDS>(() => _i17.ProfileLocalDSImpl());
  gh.lazySingleton<_i18.RequestCheckWrapper>(
      () => _i18.RequestCheckWrapperImpl());
  gh.factory<_i19.TabsStateManager>(
      () => _i19.TabsStateManager(gh<_i20.TabsRouter>()));
  gh.lazySingleton<_i21.AuthRepo>(() => _i21.FirebaseAuthRepoImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i22.ConnectDS>(() => _i22.ConnectDSImpl(
        gh<_i18.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i21.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i23.CoordinatesRemoteDS>(() => _i23.CoordinatesDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i11.GeoFlutterFire>(),
        gh<_i21.AuthRepo>(),
        gh<_i18.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.singleton<_i24.CoordinatesRepo>(_i24.CoordinatesRepoImpl(
    gh<_i5.CoordinatesLocalDS>(),
    gh<_i23.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i25.OtherUserProfileDS>(() => _i25.OtherUserProfileDSImpl(
        gh<_i18.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i21.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i26.ProfileRemoteDS>(() => _i26.ProfileDSImpl(
        gh<_i21.AuthRepo>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i18.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i27.ProfileRepo>(() => _i27.ProfileRepoImpl(
        gh<_i17.ProfileLocalDS>(),
        gh<_i26.ProfileRemoteDS>(),
      ));
  gh.lazySingleton<_i28.SoulsDS>(() => _i28.SoulsDSImpl(
        gh<_i18.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i21.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i29.UserListDS>(() => _i29.UserListDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i11.GeoFlutterFire>(),
        gh<_i21.AuthRepo>(),
        gh<_i26.ProfileRemoteDS>(),
        gh<_i18.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i30.UserListRepo>(() => _i30.UserListRepoImpl(
        gh<_i29.UserListDS>(),
        gh<_i24.CoordinatesRepo>(),
        gh<_i27.ProfileRepo>(),
      ));
  gh.lazySingleton<_i31.AuthChangesListener>(() => _i31.AuthChangesListenerImpl(
        gh<_i21.AuthRepo>(),
        gh<_i27.ProfileRepo>(),
        gh<_i24.CoordinatesRepo>(),
      ));
  gh.lazySingleton<_i32.ExploreStateManager>(() => _i32.ExploreStateManager(
        gh<_i30.UserListRepo>(),
        gh<_i24.CoordinatesRepo>(),
      ));
  return getIt;
}

class _$Modules extends _i33.Modules {}
