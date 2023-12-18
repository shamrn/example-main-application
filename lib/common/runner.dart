import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_application/common/app.dart';
import 'package:main_application/common/di/injector_configurator.dart';
import 'package:main_application/common/loggers/provider_logger.dart';
import 'package:main_application/common/ui/app_assets.dart';


Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await configureDependencies();

  await Future.wait(
    AppAssets.svgAssetsForPrecache.map(
      (svgAsset) {
        final loader = SvgAssetLoader(svgAsset);

        return svg.cache.putIfAbsent(
          loader.cacheKey(null),
          () => loader.loadBytes(null),
        );
      },
    ),
  );

  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const App(),
  ));
}
