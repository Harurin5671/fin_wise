class AppRoutes {
static const home = _RouteInfo('home', '/home');
}

class _RouteInfo {
  final String name;
  final String path;
  const _RouteInfo(this.name, this.path);
}