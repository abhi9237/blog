import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../blog_upload/presentation/pages/upload_blog_selection.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../profile/presentation/pages/profile.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial(0)) {
    on<BottomNavChangeIndexEvent>(changeIndex);
  }

  void changeIndex(BottomNavChangeIndexEvent e, Emitter emit) {
    emit(BottomNavSelectIndexState(e.selectedIndex));
  }
}
