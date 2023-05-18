// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:cloud_firestore/cloud_firestore.dart' as _i10;
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i11;
import 'package:flutter_mobile_starter/common/auth/repo/auth_repo.dart' as _i23;
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i19;
import 'package:flutter_mobile_starter/common/configs/auth_changes_listener.dart'
    as _i35;
import 'package:flutter_mobile_starter/common/image_handling/image_service.dart'
    as _i27;
import 'package:flutter_mobile_starter/common/navigation/auto_router/app_router.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/navigation/my_bottom_nav_bar.dart'
    as _i20;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i6;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i16;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_local_ds.dart'
    as _i5;
import 'package:flutter_mobile_starter/screens/explore/ds/coordinates_remote_ds.dart'
    as _i25;
import 'package:flutter_mobile_starter/screens/explore/ds/user_list_ds.dart'
    as _i33;
import 'package:flutter_mobile_starter/screens/explore/repo/coordinates_repo.dart'
    as _i26;
import 'package:flutter_mobile_starter/screens/explore/repo/user_list_repo.dart'
    as _i34;
import 'package:flutter_mobile_starter/screens/explore/state/explore_state_manager.dart'
    as _i36;
import 'package:flutter_mobile_starter/screens/other_user/ds/connect_ds.dart'
    as _i24;
import 'package:flutter_mobile_starter/screens/other_user/ds/other_user_profile_ds.dart'
    as _i28;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_local_ds.dart'
    as _i18;
import 'package:flutter_mobile_starter/screens/profile/ds/profile_remote_ds.dart'
    as _i29;
import 'package:flutter_mobile_starter/screens/profile/ds/souls_ds.dart'
    as _i32;
import 'package:flutter_mobile_starter/screens/profile/repo/profile_repo.dart'
    as _i30;
import 'package:flutter_mobile_starter/screens/profile/state/profile_content_manager.dart'
    as _i37;
import 'package:flutter_mobile_starter/screens/profile/state/profile_images_manager.dart'
    as _i17;
import 'package:flutter_mobile_starter/screens/profile/state/profile_texts_manager.dart'
    as _i31;
import 'package:geoflutterfire2/geoflutterfire2.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i13;
import 'package:image_picker/image_picker.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;
import 'package:uuid/uuid.dart' as _i22;

import 'modules.dart' as _i38;

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
  gh.lazySingleton<_i11.FirebaseStorage>(() => modules.firebaseStorage);
  gh.lazySingleton<_i12.GeoFlutterFire>(() => modules.getFlutterFire);
  gh.lazySingleton<_i13.ImageCropper>(() => modules.imageCropper);
  gh.lazySingleton<_i14.ImagePicker>(() => modules.imagePicker);
  gh.lazySingleton<_i15.InternetConnectionChecker>(
      () => modules.internetConnectionChecker);
  gh.lazySingleton<_i16.LoggerConfig>(() => _i16.LoggerConfig());
  gh.factory<_i17.ProfileImagesManager>(() => _i17.ProfileImagesManager());
  gh.lazySingleton<_i18.ProfileLocalDS>(() => _i18.ProfileLocalDSImpl());
  gh.lazySingleton<_i19.RequestCheckWrapper>(
      () => _i19.RequestCheckWrapperImpl());
  gh.factory<_i20.TabsStateManager>(
      () => _i20.TabsStateManager(gh<_i21.TabsRouter>()));
  gh.lazySingleton<_i22.Uuid>(() => modules.uuid);
  gh.lazySingleton<_i23.AuthRepo>(() => _i23.FirebaseAuthRepoImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i24.ConnectDS>(() => _i24.ConnectDSImpl(
        gh<_i19.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i23.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i25.CoordinatesRemoteDS>(() => _i25.CoordinatesDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i23.AuthRepo>(),
        gh<_i19.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.singleton<_i26.CoordinatesRepo>(_i26.CoordinatesRepoImpl(
    gh<_i5.CoordinatesLocalDS>(),
    gh<_i25.CoordinatesRemoteDS>(),
  ));
  gh.lazySingleton<_i27.ImageService>(() => _i27.FirebaseImageServiceImpl(
        gh<_i11.FirebaseStorage>(),
        gh<_i6.CustomLogger>(),
        gh<_i19.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i28.OtherUserProfileDS>(() => _i28.OtherUserProfileDSImpl(
        gh<_i19.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i23.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i29.ProfileRemoteDS>(() => _i29.ProfileDSImpl(
        gh<_i23.AuthRepo>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i19.RequestCheckWrapper>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i30.ProfileRepo>(() => _i30.ProfileRepoImpl(
        gh<_i18.ProfileLocalDS>(),
        gh<_i29.ProfileRemoteDS>(),
      ));
  gh.factory<_i31.ProfileTextsAndTagsManager>(
      () => _i31.ProfileTextsAndTagsManager(gh<_i30.ProfileRepo>()));
  gh.lazySingleton<_i32.SoulsDS>(() => _i32.SoulsDSImpl(
        gh<_i19.RequestCheckWrapper>(),
        gh<_i10.FirebaseFirestore>(),
        gh<_i23.AuthRepo>(),
        gh<_i6.CustomLogger>(),
      ));
  gh.lazySingleton<_i33.UserListDS>(() => _i33.UserListDSImpl(
        gh<_i10.FirebaseFirestore>(),
        gh<_i12.GeoFlutterFire>(),
        gh<_i23.AuthRepo>(),
        gh<_i29.ProfileRemoteDS>(),
        gh<_i19.RequestCheckWrapper>(),
      ));
  gh.lazySingleton<_i34.UserListRepo>(() => _i34.UserListRepoImpl(
        gh<_i33.UserListDS>(),
        gh<_i26.CoordinatesRepo>(),
        gh<_i30.ProfileRepo>(),
      ));
  gh.lazySingleton<_i35.AuthChangesListener>(() => _i35.AuthChangesListenerImpl(
        gh<_i23.AuthRepo>(),
        gh<_i30.ProfileRepo>(),
        gh<_i26.CoordinatesRepo>(),
      ));
  gh.lazySingleton<_i36.ExploreStateManager>(() => _i36.ExploreStateManager(
        gh<_i34.UserListRepo>(),
        gh<_i26.CoordinatesRepo>(),
      ));
  gh.lazySingleton<_i37.ProfileContentManager>(
      () => _i37.ProfileContentManager(gh<_i30.ProfileRepo>()));
  return getIt;
}

class _$Modules extends _i38.Modules {}
