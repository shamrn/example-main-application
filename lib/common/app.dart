import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_application/common/di/injector_configurator.dart';
import 'package:main_application/common/routing/app_router.dart';
import 'package:main_application/common/ui/light_theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  AppRouter get _appRouter => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ru'),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        ),
      ),
    );
  }
}
