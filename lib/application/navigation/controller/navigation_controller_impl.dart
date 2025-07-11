import 'navigation_controller.dart';
import 'package:fin_wise/application/navigation/cubit/nav_cubit.dart';

class NavigationControllerImpl implements NavigationController {
  final NavCubit _cubit;

  NavigationControllerImpl(this._cubit);

  @override
  void changeIndex(int index) => _cubit.setIndex(index);

  @override
  int get currentIndex => _cubit.state.index;

  @override
  Stream<int> get indexStream =>
      _cubit.stream.map((state) => state.index).distinct();
}
