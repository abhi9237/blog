import 'package:bloc/bloc.dart';
import 'package:blog/features/home/domain/usecase/home_case.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBocState> {
  final HomeCase _homeCase;

  HomeBloc(this._homeCase) : super(HomeBlocInitialState()){
    on<HomeBlocInitialEvent>(getHomeBlogs);
  }
  Future<void> getHomeBlogs(
    HomeBlocInitialEvent event,
    Emitter<HomeBocState> emit,
  ) async {
    emit(HomeBlocLoadingState());

    final result = await _homeCase.call(null);

    result.fold(
      (failure) {
        emit(HomeBlocFailureState(failure.message));
      },
      (blogs) {
        print('All blogs List===> ${blogs}');
        emit(state.copyWith(getAllBlogs: blogs));
      },
    );
  }
}
