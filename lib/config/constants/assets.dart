class Assets {
  const Assets._();
  static const iconsNavBarSVG = _IconsNavBarSVG();
}

class _IconsNavBarSVG {
  const _IconsNavBarSVG();

  String get _basePath => 'assets/icons/svg/nav_bar/';

  String get home => '$_basePath/home.svg';
  String get analysis => '$_basePath/analysis.svg';
  String get transaction => '$_basePath/transaction.svg';
  String get category => '$_basePath/category.svg';
  String get profile => '$_basePath/profile.svg';
}
