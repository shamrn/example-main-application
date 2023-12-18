import 'package:injectable/injectable.dart';
import 'package:main_application/common/routing/app_router.dart';

@module
abstract class InjectorModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
