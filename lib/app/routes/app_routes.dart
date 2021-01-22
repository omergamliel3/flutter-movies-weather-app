import 'package:sailor/sailor.dart';

import '../features/presentation/index.dart';

part 'app_pages.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: Pages.SPLASH,
      builder: (context, args, params) {
        return LoadingView();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: Pages.MAIN,
      builder: (context, args, params) {
        return MainView();
      },
    ));
  }
}
