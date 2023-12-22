import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_application/common/routing/routes.dart';
import 'package:main_application/features/profile/profile_page.dart';
import 'package:main_library/common/ui/app_colors.dart';
import 'package:main_library/features/home/home_page.dart';
import 'package:main_library/features/initial/initial_page.dart';

class RoutesFactory {
  static String get initialRoute => Routes.initial;

  Map<String, Widget Function(BuildContext)> get _routes => {
        Routes.initial: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                systemNavigationBarColor: AppColors.white.withOpacity(0.01),
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
              child: const InitialPage(),
            ),
        Routes.home: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                systemNavigationBarColor: AppColors.white.withOpacity(0.01),
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
              child: const HomePage(),
            ),
        Routes.profile: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                systemNavigationBarColor: AppColors.white.withOpacity(0.01),
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
              child: const ProfilePage(),
            ),
      };

  Route<dynamic> getGeneratedRoutes(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (context) => _routes[settings.name]!(context),
    );
  }
}
