import 'package:fin_wise/core/di/service_locator.dart';

class Bootstrap {
  static Future<void> init() async {
    await setupServiceLocator();
  }
}
