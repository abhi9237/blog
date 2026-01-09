import 'package:blog/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavWidget extends StatelessWidget {
  final BottomNavState state;
  const BottomNavWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: state.selectedIndex ?? 0,
      onTap: (i) {
        context.read<BottomNavBloc>().add(
          BottomNavChangeIndexEvent(selectedIndex: i),
        );
      },
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
