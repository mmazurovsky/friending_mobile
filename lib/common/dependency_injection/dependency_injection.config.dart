// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart' as _i12;
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i10;
import 'package:flutter_mobile_starter/common/navigation/my_bottom_nav_bar.dart'
    as _i13;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i9;
import 'package:flutter_mobile_starter/screens/other_user/ds/connect_ds.dart'
    as _i14;
import 'package:flutter_mobile_starter/screens/other_user/ds/other_user_profile_ds.dart'
    as _i15;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_ds.dart'
    as _i16;
import 'package:flutter_mobile_starter/screens/profile/ds/souls_ds.dart'
    as _i11;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'modules.dart' as _i17;

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
  gh.lazySingleton<_i3.CustomLogger>(() => _i3.LoggerImpl());
  gh.lazySingleton<_i4.FirebaseAnalytics>(() => modules.firebaseAnalytics);
  gh.lazySingleton<_i5.FirebaseAuth>(() => modules.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseCrashlytics>(() => modules.firebaseCrashlytics);
  gh.lazySingleton<_i7.FirebaseFirestore>(() => modules.firebaseFirestore);
  gh.lazySingleton<_i8.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.lazySingleton<_i9.LoggerConfig>(() => _i9.LoggerConfig());
  gh.lazySingleton<_i10.RequestCheckWrapper>(
      () => _i10.RequestCheckWrapperImpl());
  gh.lazySingleton<_i11.SoulsDS>(() => _i11.SoulsDSImpl(
        gh<_i10.RequestCheckWrapper>(),
        gh<_i7.FirebaseFirestore>(),
        gh<_i12.AuthRepo>(),
        gh<_i3.CustomLogger>(),
      ));
  gh.lazySingleton<_i13.TabsChangeNotifier>(() => _i13.TabsChangeNotifier());
  gh.lazySingleton<_i14.ConnectDS>(() => _i14.ConnectDSImpl(
        gh<_i10.RequestCheckWrapper>(),
        gh<_i7.FirebaseFirestore>(),
        gh<_i12.AuthRepo>(),
        gh<_i3.CustomLogger>(),
      ));
  gh.lazySingleton<_i15.OtherUserProfileDS>(() => _i15.OtherUserProfileDSImpl(
        gh<_i10.RequestCheckWrapper>(),
        gh<_i7.FirebaseFirestore>(),
        gh<_i12.AuthRepo>(),
        gh<_i3.CustomLogger>(),
      ));
  gh.lazySingleton<_i16.ProfileDS>(() => _i16.ProfileDSImpl(
        gh<_i12.AuthRepo>(),
        gh<_i7.FirebaseFirestore>(),
        gh<_i10.RequestCheckWrapper>(),
        gh<_i3.CustomLogger>(),
      ));
  return getIt;
}

class _$Modules extends _i17.Modules {}
