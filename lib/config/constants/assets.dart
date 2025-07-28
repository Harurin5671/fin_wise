class Assets {
  const Assets._();
  static const iconsNavBarSVG = _IconsNavBarSVG();
  static const iconsNotificationsSVG = _IconsNotificationsSVG();
  static const iconsProfileSVG = _IconsProfileSVG();
  static const iconsSvg = _IconsSvg();
  static const iconJpg = _IconsJpg();
}

class _IconsNavBarSVG {
  const _IconsNavBarSVG();

  String get _basePath => 'assets/icons/svg/nav_bar';

  String get home => '$_basePath/home.svg';
  String get analysis => '$_basePath/analysis.svg';
  String get transaction => '$_basePath/transaction.svg';
  String get category => '$_basePath/category.svg';
  String get profile => '$_basePath/profile.svg';
}

class _IconsNotificationsSVG {
  const _IconsNotificationsSVG();

  String get _basePath => 'assets/icons/svg/notifications';

  String get expense => '$_basePath/expense.svg';
  String get reminder => '$_basePath/reminder.svg';
  String get saving => '$_basePath/saving.svg';
  String get transaction => '$_basePath/transaction.svg';
  String get update => '$_basePath/update.svg';
}

class _IconsProfileSVG {
  const _IconsProfileSVG();

  String get _basePath => 'assets/icons/svg/profile';

  String get editProfile => '$_basePath/edit_profile.svg';
  String get security => '$_basePath/security.svg';
  String get setting => '$_basePath/setting.svg';
  String get help => '$_basePath/help.svg';
  String get logOut => '$_basePath/log_out.svg';
}

class _IconsSvg {
  const _IconsSvg();

  String get _basePath => 'assets/icons/svg';

  String get arrowBack => '$_basePath/icon_arrow_back.svg';
  String get income => '$_basePath/income.svg';
  String get expense => '$_basePath/expense.svg';
  String get food => '$_basePath/food.svg';
  String get salary => '$_basePath/salary.svg';
  String get car => '$_basePath/car.svg';
}

class _IconsJpg {
  const _IconsJpg();

  String get _basePath => 'assets/icons/jpg';

  String get defaultAvatar => '$_basePath/user_profile_default.jpg';
}