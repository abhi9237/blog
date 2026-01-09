part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent {}

class BottomNavChangeIndexEvent extends BottomNavEvent {
  int? selectedIndex;

  BottomNavChangeIndexEvent({this.selectedIndex = 0});
}
