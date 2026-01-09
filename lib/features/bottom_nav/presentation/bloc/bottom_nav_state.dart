part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState extends Equatable {
  final int? selectedIndex;
  const BottomNavState(this.selectedIndex);

  BottomNavState copyWith(int? selectedIndex) {
    return BottomNavInitial(selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [selectedIndex];
}

final class BottomNavInitial extends BottomNavState {
  const BottomNavInitial(super.selectedIndex);
}

class BottomNavSelectIndexState extends BottomNavState {
  const BottomNavSelectIndexState(super.index);
}
