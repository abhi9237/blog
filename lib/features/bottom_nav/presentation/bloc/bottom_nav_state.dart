part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState extends Equatable {
  final int? selectedIndex;

  final List<Widget> screens = [
    HomeScreen(),
    UploadBlogSelection(),
    ProfileScreen()
  ];
  BottomNavState(this.selectedIndex);

  BottomNavState copyWith(int? selectedIndex) {
    return BottomNavInitial(selectedIndex ?? this.selectedIndex);
  }

  @override
  List<Object?> get props => [selectedIndex];
}

final class BottomNavInitial extends BottomNavState {
  BottomNavInitial(super.selectedIndex);
}

class BottomNavSelectIndexState extends BottomNavState {
  BottomNavSelectIndexState(super.index);
}
