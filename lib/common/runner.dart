import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_application/common/app.dart';
import 'package:main_application/common/di/injector_configurator.dart';
import 'package:main_application/common/env/environment_config.dart';
import 'package:main_library/common/loggers/provider_logger.dart';
import 'package:main_library/common/models/main_library_options.dart';
import 'package:main_library/main_configurator.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: 'res/config/.env');

  await configureDependencies();

  await configureMainLibrary(
    MainLibraryOptions(
      baseUrl: getIt<EnvironmentConfig>().baseUrl,
    ),
  );

  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const App(),
  ));
}
