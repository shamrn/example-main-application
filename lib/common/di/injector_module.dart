import 'package:injectable/injectable.dart';
import 'package:main_application/common/env/environment_config.dart';
import 'package:main_application/common/env/environment_config_initializer.dart';
import 'package:main_application/common/routing/app_router.dart';
import 'package:main_library/features/character/use_case/character_use_case.dart';

@module
abstract class InjectorModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @singleton
  EnvironmentConfig get environmentConfig => initEnvironmentConfig();

  @injectable
  CharacterUseCase characterUseCase() => CharacterUseCase();
}
