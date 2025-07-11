import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(const NavState(index: 0));

  void setIndex(int index){
    emit(state.copyWith(index: index));
  }
}
