import 'package:go_router/go_router.dart';

abstract class NavigationService {
  GoRouter get router;

  void go(String routePath, {Object? extra});
  void goNamed(
    String routeName, {
    Map<String, String>? params,
    Map<String, String>? queryParameters,
    Object? extra,
  });
  Future<void> push(String routePath, {Object? extra});
  Future<void> pushNamed(
    String routeName, {
    Map<String, String>? params,
    Map<String, String>? queryParameters,
    Object? extra,
  });
  void pop();
}
