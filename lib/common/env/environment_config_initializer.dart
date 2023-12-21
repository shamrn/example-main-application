import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main_library/common/env/environment_config.dart';

EnvironmentConfig initEnvironmentConfig() {
  return EnvironmentConfig.fromJson(dotenv.env);
}
