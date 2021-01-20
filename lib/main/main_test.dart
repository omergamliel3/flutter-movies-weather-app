import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'package:prospera_exercise/config/app_config.dart';
import 'package:prospera_exercise/config/build_flavor.dart';
import 'package:prospera_exercise/main/main.dart';

import '../app/routes/app_routes.dart';
import '../di/injector.dart';

Future<void> main() async {
  final appConfig = AppConfig(
    flavor: Test(),
    app: MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setupAsync();
  Injector.setup();
  await dotenv.load();
  Routes.createRoutes();
  return runApp(appConfig);
}
