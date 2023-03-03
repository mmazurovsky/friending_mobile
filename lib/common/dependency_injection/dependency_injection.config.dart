// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_mobile_starter/common/client/request_check_wrapper.dart'
    as _i5;
import 'package:flutter_mobile_starter/common/utils/logger/custom_logger.dart'
    as _i3;
import 'package:flutter_mobile_starter/common/utils/logger/logger_config.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
  gh.lazySingleton<_i3.CustomLogger>(() => _i3.LoggerImpl());
  gh.lazySingleton<_i4.LoggerConfig>(() => _i4.LoggerConfig());
  gh.lazySingleton<_i5.RequestCheckWrapper>(
      () => _i5.RequestCheckWrapperImpl(gh<_i3.CustomLogger>()));
  return getIt;
}
