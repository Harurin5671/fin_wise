import 'package:fin_wise/core/di/service_locator.dart';
import 'package:flutter/services.dart';

class Bootstrap {
  static Future<void> init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await setupServiceLocator();
  }
}
