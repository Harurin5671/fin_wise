import 'package:fin_wise/application/navigation/controller/navigation_controller.dart';
import 'package:fin_wise/application/navigation/controller/navigation_controller_impl.dart';
import 'package:fin_wise/application/navigation/cubit/nav_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  //Cubits
  sl.registerFactory(() => NavCubit());
  //Blocs

  sl.registerLazySingleton<NavigationController>(
    () => NavigationControllerImpl(sl<NavCubit>()),
  );
}
