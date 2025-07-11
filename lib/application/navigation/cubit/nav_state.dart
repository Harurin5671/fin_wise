part of 'nav_cubit.dart';

class NavState extends Equatable {
  final int index;

  const NavState({required this.index});

  NavState copyWith({int? index}) {
    return NavState(index: index ?? this.index);
  }

  @override
  List<Object> get props => [index];
}
