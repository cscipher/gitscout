// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:git_scout/core/analytics/gs_analytics_contract.dart' as _i404;
import 'package:git_scout/core/analytics/gs_analytics_logger.dart' as _i291;
import 'package:git_scout/core/analytics/gs_analytics_module.dart' as _i266;
import 'package:git_scout/core/db/app_db.dart' as _i735;
import 'package:git_scout/core/db/hive_db/hive_db.dart' as _i607;
import 'package:git_scout/core/logger/dev_logging/dev_logger.dart' as _i1002;
import 'package:git_scout/core/logger/gs_logger.dart' as _i766;
import 'package:git_scout/core/logger/gs_logger_contract.dart' as _i241;
import 'package:git_scout/core/logger/gs_logger_module.dart' as _i449;
import 'package:git_scout/core/logger/prod_logging/prod_logger.dart' as _i390;
import 'package:git_scout/core/network/api.dart' as _i525;
import 'package:git_scout/core/network/api_client/dio_client.dart' as _i628;
import 'package:git_scout/core/network/api_client/dio_client_module.dart'
    as _i1059;
import 'package:git_scout/core/network/environment/environment_config_module.dart'
    as _i872;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gsLoggerModule = _$GsLoggerModule();
    final gsAnalyticsModule = _$GsAnalyticsModule();
    final dioClientModule = _$DioClientModule();
    gh.singleton<_i974.Logger>(() => gsLoggerModule.logger);
    gh.lazySingleton<List<_i404.IGsAnalyticsContract>>(
      () => gsAnalyticsModule.contracts,
    );
    gh.lazySingleton<List<_i241.IGsLoggerContract>>(
      () => gsLoggerModule.loggers,
    );
    gh.factory<_i872.IEnvConfig>(
      () => _i872.DevEnvConfig(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i241.IGsLoggerContract>(
      () => _i1002.DevLogger(gh<_i974.Logger>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i766.GsLogger>(
      () => _i766.GsLogger(gh<List<_i241.IGsLoggerContract>>()),
    );
    gh.lazySingleton<_i291.GsAnalyticsLogger>(
      () => _i291.GsAnalyticsLogger(gh<List<_i404.IGsAnalyticsContract>>()),
      registerFor: {_prod},
    );
    gh.factory<_i872.IEnvConfig>(
      () => _i872.ProdEnvConfig(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i735.AppDb>(() => _i607.HiveDb(), registerFor: {_prod});
    gh.lazySingleton<_i241.IGsLoggerContract>(
      () => _i390.ProdLogger(),
      registerFor: {_prod},
    );
    gh.singleton<_i361.Dio>(() => dioClientModule.dio(gh<_i872.IEnvConfig>()));
    gh.lazySingleton<_i525.ApiClient>(() => _i628.DioClient(gh<_i361.Dio>()));
    return this;
  }
}

class _$GsLoggerModule extends _i449.GsLoggerModule {}

class _$GsAnalyticsModule extends _i266.GsAnalyticsModule {}

class _$DioClientModule extends _i1059.DioClientModule {}
