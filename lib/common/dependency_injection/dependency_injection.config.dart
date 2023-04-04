// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i11;
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart' as _i20;
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i16;
import 'package:flutter_mobile_starter/common/navigation/auto_router/app_router.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/navigation/my_bottom_nav_bar.dart'
    as _i17;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i8;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i15;
import 'package:flutter_mobile_starter/screens/other_user/ds/connect_ds.dart'
    as _i21;
import 'package:flutter_mobile_starter/screens/other_user/ds/other_user_profile_ds.dart'
    as _i22;
import 'package:flutter_mobile_starter/screens/people/ds/coordinates_local_ds.dart'
    as _i6;
import 'package:flutter_mobile_starter/screens/people/ds/coordinates_remote_ds.dart'
    as _i7;
import 'package:flutter_mobile_starter/screens/people/repo/coordinates_repo.dart'
    as _i5;
import 'package:flutter_mobile_starter/screens/people/repo/user_list_repo.dart'
    as _i19;
import 'package:flutter_mobile_starter/screens/people/state/explore_state_manager.dart'
    as _i18;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_local_ds.dart'
    as _i25;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_remote_ds.dart'
    as _i23;
import 'package:flutter_mobile_starter/screens/profile/ds/souls_ds.dart'
    as _i26;
import 'package:flutter_mobile_starter/screens/profile/repo/profile_repo.dart'
    as _i24;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;

import 'modules.dart' as _i27;

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
  gh.lazySingleton<_i5.CoordinatesRepo>(() => _i5.CoordinatesRepoImpl(
        gh<_i6.CoordinatesLocalDS>(),
        gh<_i7.CoordinatesRemoteDS>(),
      ));
  gh.lazySingleton<_i8.CustomLogger>(() => _i8.LoggerImpl());
  gh.lazySingleton<_i9.FirebaseAnalytics>(() => modules.firebaseAnalytics);
  gh.lazySingleton<_i10.FirebaseAuth>(() => modules.firebaseAuth);
  gh.lazySingleton<_i11.FirebaseCrashlytics>(() => modules.firebaseCrashlytics);
  gh.lazySingleton<_i12.FirebaseFirestore>(() => modules.firebaseFirestore);
  gh.lazySingleton<_i13.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.lazySingleton<_i14.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i15.LoggerConfig>(() => _i15.LoggerConfig());
  gh.lazySingleton<_i16.RequestCheckWrapper>(
      () => _i16.RequestCheckWrapperImpl());
  gh.lazySingleton<_i17.TabsStateManager>(() => _i17.TabsStateManager());
  gh.lazySingleton<_i18.UserListNotifier>(() => _i18.UserListNotifier(
        gh<_i19.UserListRepo>(),
        gh<_i5.CoordinatesRepo>(),
      ));
  gh.lazySingleton<_i20.AuthRepo>(() => _i20.FirebaseAuthRepoImpl(
        gh<_i10.FirebaseAuth>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i21.ConnectDS>(() => _i21.ConnectDSImpl(
        gh<_i16.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i20.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i22.OtherUserProfileDS>(() => _i22.OtherUserProfileDSImpl(
        gh<_i16.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i20.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i23.ProfileRemoteDS>(() => _i23.ProfileDSImpl(
        gh<_i20.AuthRepo>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i16.RequestCheckWrapper>(),
        gh<_i8.CustomLogger>(),
      ));
  gh.lazySingleton<_i24.ProfileRepo>(() => _i24.ProfileRepoImpl(
        gh<_i25.ProfileLocalDS>(),
        gh<_i23.ProfileRemoteDS>(),
      ));
  gh.lazySingleton<_i26.SoulsDS>(() => _i26.SoulsDSImpl(
        gh<_i16.RequestCheckWrapper>(),
        gh<_i12.FirebaseFirestore>(),
        gh<_i20.AuthRepo>(),
        gh<_i8.CustomLogger>(),
      ));
  return getIt;
}

class _$Modules extends _i27.Modules {}
