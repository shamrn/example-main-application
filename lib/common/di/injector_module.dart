import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_library/common/env/environment_config.dart';
import 'package:main_library/common/env/environment_config_initializer.dart';
import 'package:main_library/common/routing/app_router.dart';

@module
abstract class InjectorModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  EnvironmentConfig get environmentConfig => initEnvironmentConfig();

  @preResolve
  @singleton
  Future<Dio> dio() async =>
      Dio(BaseOptions(baseUrl: environmentConfig.baseUrl));
}
