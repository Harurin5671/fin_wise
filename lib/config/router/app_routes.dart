class AppRoutes {
static const home = _RouteInfo('home', '/home');
static const notifications = _RouteInfo('notifications', '/notifications');
static const analysis = _RouteInfo('analysis', '/analysis');
static const transaction = _RouteInfo('transaction', '/transaction');
static const categories = _RouteInfo('categories', '/categories');
static const profile = _RouteInfo('profile', '/profile');
}

class _RouteInfo {
  final String name;
  final String path;
  const _RouteInfo(this.name, this.path);
}