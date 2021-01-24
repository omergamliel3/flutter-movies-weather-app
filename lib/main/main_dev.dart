import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import '../config/app_config.dart';
import '../config/build_flavor.dart';

import '../app/routes/app_routes.dart';
import '../di/injector.dart';

import 'main.dart';

Future<void> main() async {
  final appConfig = AppConfig(
    flavor: Dev(),
    app: MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setupAsync();
  Injector.setup();
  await dotenv.load();
  Routes.createRoutes();
  return runApp(appConfig);
}
