import 'package:fin_wise/config/router/app_router.dart';
import 'package:go_router/go_router.dart';

import 'navigation_service.dart';

class NavigationServiceImpl implements NavigationService {
  final GoRouter _router;

  NavigationServiceImpl({GoRouter? router}) : _router = router ?? appRouter;

  @override
  void go(String routePath, {Object? extra}) {
    _router.go(routePath, extra: extra);
  }

  @override
  void goNamed(
    String routeName, {
    Map<String, String>? params,
    Map<String, String>? queryParameters,
    Object? extra,
  }) {
    _router.goNamed(
      routeName,
      pathParameters: params ?? {},
      queryParameters: queryParameters ?? {},
      extra: extra,
    );
  }

  @override
  void pop() {
    if (_router.canPop()) {
      _router.pop();
    }
  }

  @override
  Future<void> push(String routePath, {Object? extra}) async {
    await _router.push(routePath, extra: extra);
  }

  @override
  Future<void> pushNamed(
    String routeName, {
    Map<String, String>? params,
    Map<String, String>? queryParameters,
    Object? extra,
  }) async {
    await _router.pushNamed(
      routeName,
      pathParameters: params ?? {},
      queryParameters: queryParameters ?? {},
      extra: extra,
    );
  }

  @override
  GoRouter get router => _router;
}
